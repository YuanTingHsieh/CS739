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
fuse_command_err = "sudo -u ceph " + ERRFS_HOME + "/errfs -f -oallow_other,modules=subdir,subdir=%s %s err %s %s %s &"
#fuse_command_err = "sudo -u ceph " + ERRFS_HOME + "/errfs -f -oallow_other,modules=subdir,subdir=%s %s trace %s &"
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

#def raw_input(inputs):
#	pass

def kill_proc(proc, timeout):
	timeout["value"] = True
	proc.kill()

def invoke_cmd(cmd):
	
	cmds= shlex.split(cmd)
	p = subprocess.Popen(cmds, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	kill = lambda process : process.kill()
	my_timer  = Timer(60,kill,[p])
	try:
		my_timer.start()
		out, err = p.communicate()
		return (out, err)
	finally:
		print "TIMER EXPIRED!!" 
		my_timer.cancel()

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
	print "beforer killing ceph"
	try:
		cmd = "sudo killall ceph-osd"
		out_err = subprocess.check_output(cmd,shell=True, stderr= subprocess.STDOUT)
		print "killing ceph",out_err
	except Exception,e:
		print e
	print "after killing ceph"

def start_ceph():
	kill_ceph()
	cmd = "sudo -u ceph /usr/bin/ceph-osd -i 0 -f"
	print "before starting ceph"
	foreground_ceph = subprocess.Popen(shlex.split(cmd),preexec_fn=os.setpgrp)
	print "after starting ceph"
	return foreground_ceph


"""
    Collect from each trace file, insert into err_map
    err_map[vm1,av.zip] = ([w,(666)], [w,(667)] ... [w,(6666)])
"""
for trace_file in trace_files:
	machines.append(machine)
	assert os.path.exists(trace_file)
	assert os.stat(trace_file).st_size > 0
	print trace_file
	with open(trace_file, "r") as f:
		for line in f:
			print line
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


def umount(mp):
	try:
		subprocess.check_output("sudo umount %s " % mp , shell= True , stderr = subprocess.STDOUT)
	except Exception, e:
		print e

def truncate_dir(dir_path):
	try:
		subprocess.check_output("sudo rm -rf %s/*" , shell=True, stderr = subprocess.STDOUT)
	except Exception, e:
		print e
def copy_except_journal(src,dst): 
	try:
		subprocess.check_output("sudo rsync -LKX -ar --exclude=journal %s/ %s"% (src,dst), shell = True)
	except Exception, e:
		print e

def overwrite_journal():
	subprocess.check_output("sudo dd if=/dev/sdd1 of=/dev/sdc1 bs=128k", shell = True)

def restore_from_backup():
	for mach in machines:
		errfs_mp    = data_dir_mount_points[mach]
		original_mp = data_dirs[mach]
		backup_mp   = data_dir_snapshots[mach]
		umount(errfs_mp)
		truncate_dir(original_mp)
		copy_except_journal(backup_mp,original_mp)	
	overwrite_journal()
	pass

def setup_before_state( corrupt_machine,log_dir_path):
	restore_from_backup()
	subprocess.check_output("sudo rm -rf " + data_dir_mount_points[corrupt_machine], shell = True)	
	subprocess.check_output("sudo install -d -o ceph -g ceph -m 755 " + data_dir_mount_points[corrupt_machine], shell = True)	
	subprocess.check_output("sudo ln -snf /dev/sdc1 /var/lib/ceph/osd/ceph-0/journal ", shell = True)
	os.system("sudo rm -f newtest.txt")
	os.system("rm -rf " + log_dir_path)
	os.system("install -d -o ceph -g ceph -m 755 " + log_dir_path)
	os.system("rm -rf /tmp/shoulderr")
	os.system("touch /tmp/shoulderr; chown ceph:ceph /tmp/shoulderr; chmod 777 /tmp/shoulderr; echo \'fals\' >> /tmp/shoulderr")



def start_errfs(corrupt_machine,corrupt_filename,block,err_type):
	fuse_start_command = fuse_command_err%(data_dirs[corrupt_machine], data_dir_mount_points[corrupt_machine], corrupt_filename, block, err_type)
	os.system(fuse_start_command)

def stop_errfs(corrupt_machine):
	fuse_stop_command = fuse_unmount_command%(data_dir_mount_points[corrupt_machine])
	os.system(fuse_stop_command)
	os.system('sleep 1')
	os.system('sudo killall errfs')



def execute_workload(corrupt_machine,log_dir_path):	
	data_dir_curr = map(lambda mach : data_dir_mount_points[mach] if corrupt_machine == mach else data_dirs[mach], machines)
	workload_command_curr = workload_command + " cords "
	workload_command_curr += " ".join(data_dir_curr)
	workload_command_curr += " " + log_dir_path
	print "invoke cmnd",workload_command_curr
	(out, err) = invoke_cmd(workload_command_curr)

def check_ok():
	import filecmp
	for i in range(5):
		try:
			if not filecmp.cmp("/home/ceph-admin/CORDS/newtest%d.txt"%i,"/home/ceph-admin/CORDS/test.txt"):
				exit(-1)
				return (False,"file corrupted")
	
		except Exception,e:
			return (False,"file missing")
	return (True,"")
def backup_resutls(log_dir_path):
	os.system('mv /tmp/shoulderr ' + log_dir_path)
	for mach in machines:
		os.system('sudo rsync -LK -ar --exclude=journal ' + data_dirs[mach] + '/ ' + log_dir_path)


def cords_check(results):
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
				#log_dir =  'result_' + (str(corrupt_machine) + '_' + str(corrupt_filename[dir_index :]) + '_' + str(block) + '_' + str(op) + '_' + str(err_type)).replace('/', '_')
				log_dir =  'result_%d_%s_%d_%s_%s'%(corrupt_machine,corrupt_filename[dir_index :],block,op,(err_type).replace('/', '_'))
				log_dir_path =  os.path.join(cords_results_base_dir, log_dir)
                
				kill_ceph()
				stop_errfs(corrupt_machine)
				setup_before_state(corrupt_machine,log_dir_path)
			
				start_errfs(corrupt_machine,corrupt_filename,block,err_type)
				start_ceph()
				execute_workload(corrupt_machine,log_dir_path)	
				
				kill_ceph()	
				stop_errfs(corrupt_machine)
				
				ok,msg = check_ok()
				raw_input(msg)
				
				if(ok):
					results.append( (log_dir,"success"))
				else:
					results.append( (log_dir,msg))
				
				backup_resutls(log_dir_path)								
				count += 1
				print 'States completed:' + str(count) + '/' + str(total)

if __name__ == "__main__":
	results = list()				
	start_test = time.time()
	cords_check(results)
	print 'cords-check done!'
	end_test = time.time()
	print 'Testing took ' + str((end_test - start_test)) + ' seconds...'
	print results

