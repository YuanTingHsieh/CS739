#! /usr/bin/env python
# Copyright (c) 2016 Aishwarya Ganesan and Ramnatthan Alagappan.
# All Rights Reserved.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import shlex
import os
import sys
import math
from collections import defaultdict
import subprocess
import argparse
import time
from threading import Timer

BLOCKSIZE = 4096

ERRFS_HOME = os.path.dirname(os.path.realpath(__file__))
fuse_command_err = ERRFS_HOME + "/errfs -f -oallow_other,modules=subdir,subdir=%s %s err %s %s %s &"
fuse_command_err = "sudo " + ERRFS_HOME + "/errfs -f -oallow_other,modules=subdir,subdir=%s %s err %s %s %s &"
fuse_command_err = "sudo " + ERRFS_HOME + "/errfs -f -oallow_other,modules=subdir,subdir=%s %s trace %s &"
#fuse_command_err = ERRFS_HOME + "/errfs -f -omodules=subdir,subdir=%s %s err %s %s %s &"
fuse_unmount_command = "sudo " + "fusermount -u %s > /dev/null"
uppath = lambda _path, n: os.sep.join(_path.split(os.sep)[:-n])

parser = argparse.ArgumentParser()
parser.add_argument('--trace_files', nargs='+', required = True, help = 'Trace file paths')
parser.add_argument('--data_dirs', nargs='+', required = True, help = 'Location of data directories')
parser.add_argument('--workload_command', type = str)
parser.add_argument('--cords_results_base_dir', type = str, default='/run/shm', help = 'Location for checker state and results')
parser.add_argument('--checker_command', type = str, help = 'Checker for workloads that modify application state')

uppath = lambda _path, n: os.sep.join(_path.split(os.sep)[:-n])

def kill_proc(proc, timeout):
	timeout["value"] = True
	proc.kill()

def invoke_cmd(cmd):
	p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	out, err = p.communicate()
	return (out, err)

def block_roundup(x):
    return math.ceil(x * 1.0 / BLOCKSIZE) * BLOCKSIZE

def block_rounddown(x):
    return math.floor(x * 1.0 / BLOCKSIZE) * BLOCKSIZE

"""
    Return the range of block numbers touched by each record
"""

def get_block_nrs(offset, size):
	start_offset = offset
	end_offset = start_offset + size
	total_blocks_touched = int((block_roundup(end_offset) - block_rounddown(start_offset)) / BLOCKSIZE)
	
	assert total_blocks_touched >= 1
	start_block_nr = int(math.floor(start_offset / BLOCKSIZE))
	return range(start_block_nr, start_block_nr + total_blocks_touched)

data_dir_snapshots = []
data_dir_mount_points = []
args = parser.parse_args()


for i in range(0, len(args.trace_files)):
	args.trace_files[i] = os.path.abspath(args.trace_files[i])

for i in range(0, len(args.data_dirs)):
	args.data_dirs[i] = os.path.abspath(args.data_dirs[i])
	data_dir_snapshots.append(os.path.join(uppath(args.data_dirs[i], 1), os.path.basename(os.path.normpath(args.data_dirs[i]))+ ".snapshot"))
	data_dir_mount_points.append(os.path.join(uppath(args.data_dirs[i], 1), os.path.basename(os.path.normpath(args.data_dirs[i]))+ ".mp"))

trace_files = args.trace_files
data_dirs = args.data_dirs

assert len(trace_files) == len(data_dirs) and len(trace_files) == len(data_dir_snapshots) and len(trace_files) == len(data_dir_mount_points)
workload_command = args.workload_command
checker_command = args.checker_command
cords_results_base_dir = args.cords_results_base_dir

os.system('rm -rf ' + cords_results_base_dir+'/*')

replay_check_needed = False
if checker_command is not None and len(checker_command) > 0:
	replay_check_needed = True

err_map = defaultdict(set)
machines = []
machine = 0 


def kill_ceph():
	try:
		cmd = "sudo killall ceph-osd"
		out_err = subprocess.check_output(cmd,shell=True, stderr= subprocess.STDOUT)
		print "killing ceph",out_err
	except Exception,e:
		print e

def start_ceph():
	kill_ceph()
	cmd = "sudo -u ceph /usr/bin/ceph-osd -i 0 -f"
	foreground_ceph = subprocess.Popen(shlex.split(cmd),preexec_fn=os.setpgrp)



"""
    Collect from each trace file, insert into err_map
    err_map[vm1,av.zip] = ([w,(666)], [w,(667)] ... [w,(6666)])
"""
for trace_file in trace_files:
	machines.append(machine)
	assert os.path.exists(trace_file)
	assert os.stat(trace_file).st_size > 0
	with open(trace_file, "r") as f:
		for line in f:
			line = line.split('\t')
			if line[0] in ['rename', 'unlink', 'link', 'symlink']:
				pass
			else:
				assert len(line) == 4
				filename = line[0]
				op = line[1]
				assert op == 'w' or op == 'r' or op == 'a'
				offset = int(line[2])
				size = int(line[3])
				block_nrs = get_block_nrs(offset, size)

				for block_nr in block_nrs:
					err_map[(machine, filename)].add((op, block_nr))

	machine += 1

assert len(machines) > 0

def get_error_modes(op):
	if op == 'r':
		return ["eio", "cz", "cg"]
	elif op == 'w': 
		return ["eio"]
	elif op == 'a': 
		return ["eio", "esp"]
	else:
		assert False

def cords_count():
	total = 0
	for key in err_map:
		corrupt_machine = key[0]
		other_machines = [i for i in machines if i != corrupt_machine]
		assert len([corrupt_machine] + other_machines) == len(machines)
		corrupt_filename = key[1] 
		block_ops = list(err_map[key])
		
		for (op, block) in block_ops:
			possible_err_modes = get_error_modes(op)
			for err_type in possible_err_modes:
				total += 1

	return total
				
def cords_check():
	total = cords_count()
	count = 0
	for key in err_map:
		corrupt_machine = key[0] # machine
		other_machines = [i for i in machines if i != corrupt_machine]
		assert len([corrupt_machine] + other_machines) == len(machines)
		corrupt_filename = key[1]  # filename
		block_ops = list(err_map[key]) # [ (op,block_num) ]
		
		for (op, block) in block_ops:
			possible_err_modes = get_error_modes(op)
			for err_type in possible_err_modes:
				dir_index = str(corrupt_filename).rfind(data_dirs[corrupt_machine]) + len(data_dirs[corrupt_machine]) + 1			
				log_dir =  'result_' + (str(corrupt_machine) + '_' + str(corrupt_filename[dir_index :]) + '_' + str(block) + '_' + str(op) + '_' + str(err_type)).replace('/', '_')
				log_dir_path =  os.path.join(cords_results_base_dir, log_dir)
				
				print str(op) + ' ' + str(corrupt_machine) + ':' + str(corrupt_filename) + ':' + str(block) + ':' + str(err_type)
				for mach in machines:
                                    try:
					subprocess.check_output("sudo umount " + data_dirs[mach] +".mp", shell = True,stderr=subprocess.STDOUT)
                                    except Exception,e:
                                        pass
                                    print "Removing Data"
                                    subprocess.check_output("sudo rm -rf " + data_dirs[mach]+"/*", shell = True)
                                    # copy back snapshots of data
                                    print "Overwrite with Snapshot"
                                    subprocess.check_output("sudo rsync -LK -r " + data_dir_snapshots[mach] + '/ ' + data_dirs[mach], shell = True)
                                    # copy back journal TODO
                                    print "Replicating sdc1 to sdd1"
                                    subprocess.check_output("sudo dd if=/dev/sdd1 of=/dev/sdc1 bs=128k", shell = True)
                                    print "Create journal symbolic link with sdd1" 
                                    subprocess.check_output("sudo chown -R ceph:ceph /var/lib/ceph/osd/* ", shell = True)

                                kill_ceph()
				subprocess.check_output("sudo rm -rf " + data_dir_mount_points[corrupt_machine], shell = True)	
				subprocess.check_output("sudo mkdir " + data_dir_mount_points[corrupt_machine], shell = True)	

                                subprocess.check_output("sudo chown -R ceph:ceph /var/lib/ceph/osd/* ", shell = True)

                                subprocess.check_output("sudo ln -snf /dev/sdc1 /var/lib/ceph/osd/ceph-0/journal ", shell = True)
				#raw_input("Before Mounting please check permission")
                                # mount errfs
				



				#fuse_start_command = fuse_command_err%(data_dirs[corrupt_machine], data_dir_mount_points[corrupt_machine], corrupt_filename, block, err_type)
				fuse_start_command = fuse_command_err%(data_dirs[corrupt_machine], data_dir_mount_points[corrupt_machine], "/home/ceph-admin/fuck")
                                



				#print "Stating ErrFS", fuse_start_command
                                #real_command = shlex.split(fuse_start_command)
                                #p = subprocess.Popen(real_command)
				os.system(fuse_start_command)
                                #res = subprocess.check_output(fuse_start_command,shell=True)
                                
                                #print res
                                # stop and re-start ceph-osd
                                # remember modify the ceph-conf first (in /etc/ceph/ceph.conf, can call addconfig.py to do it)
				#raw_input("Before Starting OSD")
				os.system("sudo rm -f newtest.txt")
                                #if count % 20 == 0:
                                #    out = subprocess.check_output("sudo systemctl daemon-reload", stderr = subprocess.STDOUT, shell=True)
                                #print "starting osd"
                                raw_input("Before Started OSD")
				start_ceph()
				
                                raw_input("After Started OSD")
					
				data_dir_curr = []
				for mach in machines:
					data_dir_curr.append(data_dir_mount_points[mach] if corrupt_machine == mach else data_dirs[mach])
				assert len(data_dir_curr) == len(machines)				

				workload_command_curr = workload_command + " cords "
				for ddc in data_dir_curr:
					workload_command_curr +=  ddc + " "

				workload_command_curr += log_dir_path + " "

				os.system("rm -rf " + log_dir_path)
				os.system("mkdir -p " + log_dir_path)
				
				os.system("rm -rf /tmp/shoulderr")
				os.system("touch /tmp/shoulderr; echo \'fals\' >> /tmp/shoulderr")
                                print "invoke cmnd",workload_command_curr
				(out, err) = invoke_cmd(workload_command_curr)
                                print "done"
				outfile = os.path.join(log_dir_path, 'workload.out')
				os.system("rm -rf " + outfile)
				os.system("touch " + outfile)
				with open(outfile, 'a') as f:
					f.write(out + '\n' + err + '\n')

				kill_ceph()	
				fuse_unmount = fuse_unmount_command%(data_dir_mount_points[corrupt_machine]) 
				
				os.system('sleep 1')
				os.system(fuse_unmount)
				
				os.system('sleep 1')
				os.system('sudo killall errfs')

				os.system('mv /tmp/shoulderr ' + log_dir_path)

				for mach in machines:
                                        # do we need other thing here TODO
					os.system('sudo rsync -LK -r ' + data_dirs[mach] + '/ ' + log_dir_path)
				
				out = subprocess.check_output("sudo diff newtest.txt ans.txt",shell=True)
				print out
				if (out != ""):
					print "qq",op,block
				if replay_check_needed:
					checker_command_curr = checker_command + ' ' + log_dir_path
					print 'Invoking checker...'
					os.system(checker_command_curr)

				count += 1
				print 'States completed:' + str(count) + '/' + str(total)
				#if count == 1:
				#	return

start_test = time.time()
kill_ceph()
cords_check()
print 'cords-check done!'
end_test = time.time()
print 'Testing took ' + str((end_test - start_test)) + ' seconds...'
