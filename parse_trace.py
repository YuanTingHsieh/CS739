#!/usr/bin/python
import sys
import re
original_trace = sys.argv[1]
ignore = sys.argv[2]

with open(ignore,"r") as f:
	ignores = f.readlines()
	ignores  = map(lambda x : x.strip() , ignores)
	ignores = filter(lambda x : x!="",ignores)

with open(original_trace,"r") as f:
	traces = f.readlines()	
	traces = map (lambda x : x.strip() ,traces)
	traces = filter(lambda x : x!="",traces)

for trace in traces:
	not_found  = True
	for ignore in ignores:
		if (re.match(ignore,trace)):
			not_found = False	
			break
	if(not_found):
		print trace			

