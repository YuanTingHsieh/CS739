#!/usr/bin/env  python
import sys
import os
import subprocess

def invoke_cmd(cmd):
	p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	out, err = p.communicate()
	return (out, err)

filename = os.path.join(os.path.abspath('./'), 'test.txt')
f = open(os.path.join(os.path.abspath('./'), 'test.txt'), 'w')
for i in range(200):
    f.write(str(i))
f.write('\n')
f.close()

try:
    print "Making testpool"
    setup_cmd = "sudo ceph osd pool create testpool 100"
    (out, err) = invoke_cmd(setup_cmd)
    setup_cmd = "sudo ceph osd pool set testpool min_size 3"
    (out, err) = invoke_cmd(setup_cmd)
    setup_cmd = "sudo rbd pool init testpool"
    (out, err) = invoke_cmd(setup_cmd)

    print "Putting object"
	workload_cmd = 'sudo rados put -p testpool testObj%d '+filename
    for i in range(5):
        (out, err) = invoke_cmd(put_cmd % (i))
except Exception as e:
    print 'Error:' + str(e)

