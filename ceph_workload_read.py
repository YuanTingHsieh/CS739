#!/usr/bin/env  python
import sys
import os
import subprocess

def invoke_cmd(cmd):
	p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	out, err = p.communicate()
	print out,err
	return (out, err)

if sys.argv[1] == 'trace':
	print 'we are in trace mode now'
	assert(len(sys.argv) == 3)
	# format of sys.argv is ceph_workload_write.py trace wordload_dir
elif sys.argv[1] == 'cords':
	print 'we are in cords mode now, injecting faults'
	assert(len(sys.argv) == 4)
	# format of sys.argv is ceph_worload_write.py cords workload_dir result_dir

filename = os.path.join(os.path.abspath('./'), 'test.txt')
filename2 = os.path.join(os.path.abspath('./'), 'newtest.txt')

try:
	workload_cmd = 'sudo rados put -p testpool testObj6 ' + filename
	(out, err) = invoke_cmd(workload_cmd)
	workload_cmd = 'sudo rados put -p testpool testObj7 ' + filename
	(out, err) = invoke_cmd(workload_cmd)
	workload_cmd = 'sudo rados put -p testpool testObj8 ' + filename
	(out, err) = invoke_cmd(workload_cmd)
	workload_cmd = 'sudo rados put -p testpool testObj9 ' + filename
	(out, err) = invoke_cmd(workload_cmd)
	
	workload_cmd = 'sudo rados get -p testpool testObj6 ' + filename2
	(out, err) = invoke_cmd(workload_cmd)
	workload_cmd = 'sudo rados get -p testpool testObj7 ' + filename2
	(out, err) = invoke_cmd(workload_cmd)
	workload_cmd = 'sudo rados get -p testpool testObj8 ' + filename2
	(out, err) = invoke_cmd(workload_cmd)
	workload_cmd = 'sudo rados get -p testpool testObj9 ' + filename2
	(out, err) = invoke_cmd(workload_cmd)
except Exception as e:
    print 'Error:' + str(e)
print "HEEEEEEEEEEEEEEEEEEEEEEEEE!!!!!!!!!!!!!!!!!"
