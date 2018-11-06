#!/usr/bin/env  python
import sys
import os

def invoke_cmd(cmd):
	p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	out, err = p.communicate()
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
f = open(os.path.join(os.path.abspath('./'), 'test.txt'), 'w')
for i in range(8192):
    f.write(str(i))
f.write('\n')
f.close()

try:
    os.system('sudo rados put -p testpool testObj ' + filename)
except Exception as e:
    print 'Error:' + str(e)
