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
	#print 'we are in trace mode now'
	assert(len(sys.argv) == 3)
	# format of sys.argv is ceph_workload_write.py trace wordload_dir
elif sys.argv[1] == 'cords':
	#print 'we are in cords mode now, injecting faults'
	assert(len(sys.argv) == 4)
	# format of sys.argv is ceph_worload_write.py cords workload_dir result_dir

filename = os.path.join(os.path.abspath('./'), 'test.txt')
filename2 = os.path.join(os.path.abspath('./'), 'newtest.txt')


inputs = "testObj"
outputs = "test"
results = "newtest"

try:
	subprocess.check_output("rm -f /home/ceph-admin/CORDS/newtest*",shell=True)
except Exception,e:
	print e
	pass
try:
	workload_cmd = 'sudo rados put -p testpool %s%d '+filename
	for i in range(5):
		(out, err) = invoke_cmd(workload_cmd%(inputs,i))
	workload_cmd = 'sudo rados get -p testpool %s%d /home/ceph-admin/CORDS/newtest%d.txt'
	for i in range(5):
		(out, err) = invoke_cmd(workload_cmd%(inputs,i,i))
except Exception as e:
    print 'Error:' + str(e)

print "Done"
