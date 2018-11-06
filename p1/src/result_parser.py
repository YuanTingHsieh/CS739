#!/usr/bin/python

import sys
if len(sys.argv) < 2:
    print "file name required"
    exit(-1)

filename = sys.argv[1]
with open(filename) as f:
    lines = f.readlines()

for i,line in enumerate(lines):
    print i,line 
