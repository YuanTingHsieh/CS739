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
import traceback
import os
import signal
import sys
import math
from collections import defaultdict
import subprocess
import argparse
import shlex
ERRFS_HOME = os.path.dirname(os.path.realpath(__file__))
fuse_command_trace = "sudo -u ceph " + ERRFS_HOME + "/errfs -f -oallow_other,modules=subdir,subdir=%s %s trace %s &"
print fuse_command_trace

parser = argparse.ArgumentParser()
parser.add_argument('--trace_files', nargs='+', required = True, help = 'Trace file paths')
parser.add_argument('--data_dirs', nargs='+', required = True, help = 'Location of data directories')
parser.add_argument('--workload_command', required = True, type = str)
parser.add_argument('--ignore_file', type = str, default = None)

args = parser.parse_args()
for i in range(0, len(args.trace_files)):
	args.trace_files[i] = os.path.abspath(args.trace_files[i])

for i in range(0, len(args.data_dirs)):
	args.data_dirs[i] = os.path.abspath(args.data_dirs[i])

trace_files = args.trace_files
data_dirs = args.data_dirs
ignore_file = args.ignore_file

assert len(trace_files) == len(data_dirs)
machine_count = len(trace_files)

workload_command = args.workload_command

for data_dir in data_dirs:
	assert os.path.exists(data_dir)

uppath = lambda _path, n: os.sep.join(_path.split(os.sep)[:-n])

data_dir_snapshots = []
data_dir_mount_points = []
#Stop OSD!!
out = subprocess.check_output("sudo systemctl stop ceph-osd@0",stderr = subprocess.STDOUT , shell=True)

for i in range(0, machine_count):
	data_dir_snapshots.append(os.path.join(uppath(data_dirs[i], 1), os.path.basename(os.path.normpath(data_dirs[i]))+ ".snapshot"))
	data_dir_mount_points.append(os.path.join(uppath(data_dirs[i], 1), os.path.basename(os.path.normpath(data_dirs[i]))+ ".mp"))
	subprocess.check_output("rm -rf " + data_dir_snapshots[i], shell = True)
	try:
		subprocess.check_output("rmdir " + data_dir_mount_points[i], shell = True)
	except Exception,e:
		print e
		raw_input("#")
	subprocess.check_output("install -d -o ceph -g ceph -m 755  " + data_dir_mount_points[i], shell = True)

# copy things to snapshots using rsync
for i in range(0, machine_count):
	subprocess.check_output("sudo rsync -arv -LXK --exclude=journal " + data_dirs[i] + "/ " + data_dir_snapshots[i], shell = True)
	subprocess.check_output("sudo dd if=/dev/sdc1 of=/dev/sdd1 bs=128k", shell = True)
        #subprocess.check_output("sudo chown -R ceph:ceph /var/lib/ceph/osd/*", shell = True)
        #subprocess.check_output("sudo chown  root:root /var/lib/ceph/osd/ceph-0/journal", shell = True)
	#subprocess.check_output("sudo ln -sf /dev/sdd1 /var/lib/ceph/osd/ceph-0/journal", shell = True)

# remove previous trace
for i in range(0, machine_count):
	subprocess.check_output("sudo rm -rf " + trace_files[i], shell = True)
	subprocess.check_output("touch " + trace_files[i], shell = True)
	subprocess.check_output("chmod 777 " + trace_files[i], shell = True)

# mount errfs

for i in range(0, machine_count):
	print fuse_command_trace%(data_dirs[i], data_dir_mount_points[i], trace_files[i])
	os.system(fuse_command_trace%(data_dirs[i], data_dir_mount_points[i], trace_files[i]))

os.system('sleep 1')

# stop and re-start ceph-osd
# remember modify the ceph-conf first (in /etc/ceph/ceph.conf, can call addconfig.py to do it)
#out = subprocess.check_output("sudo systemctl start ceph-osd@0", stderr = subprocess.STDOUT, shell=True)
cmd = "sudo -u ceph /usr/bin/ceph-osd -i 0 -f"
try:
	foreground_ceph = subprocess.Popen(shlex.split(cmd),preexec_fn=os.setpgrp)
	workload_command +=  " trace " 
	for i in range(0, machine_count):
		workload_command += data_dir_mount_points[i] + " "
	os.system(workload_command)

	#out,err = foreground_ceph.communicate()
	#print "Ceph Output " , out
	#print "Ceph Error " , err

	print foreground_ceph.pid
	#foreground_ceph.kill()
	#foreground_ceph.wait()
	raw_input("STOP HERE")	
	pgid = os.getpgid(foreground_ceph.pid)
	os.killpg(pgid, signal.SIGTERM)
	print "After Killing"
except Exception,e:
	print e


# run workload
#out = subprocess.check_output("sudo systemctl stop ceph-osd@0",stderr = subprocess.STDOUT , shell=True)

#  unmount errfs
for mp in data_dir_mount_points:
        print "unmounting ... "
	os.system('fusermount -u ' + mp + '; sleep 1')

os.system('killall errfs >/dev/null 2>&1')

to_ignore_files = []
if ignore_file is not None:	
	with open(ignore_file, 'r') as f:
		for line in f:
			line = line.strip().replace('\n','')
                        if(line!=""):
                            to_ignore_files.append(line)

def should_ignore(filename):
	import re
        for ig in to_ignore_files:
		if re.match(ig,filename):
                        print "ignoring ",filename
			return True
	return False

for trace_file in trace_files:
        print trace_file
	assert os.path.exists(trace_file)
	assert os.stat(trace_file).st_size > 0
	if ignore_file is not None:
		to_write_final = ''
		with open(trace_file, 'r') as f:
			for line in f:
				parts = line.split('\t')
				if parts[0] in ['rename', 'unlink', 'link', 'symlink']:
					to_write_final += line
				else:
					assert len(parts) == 4
					filename = parts[0]
					if not should_ignore(filename):
						to_write_final += line

		os.remove(trace_file)
		with open(trace_file, 'w') as f:
			f.write(to_write_final)

print 'Tracing completed...'
