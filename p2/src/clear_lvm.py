#!/usr/bin/python
import subprocess
import re
out = subprocess.check_output("sudo lvm vgscan",shell=True)
lvm_id =  re.search (r"\"(.*)\"",out).groups()[0]
out = subprocess.check_output("/usr/bin/yes | sudo lvm vgremove %s"%lvm_id,shell=True)
print out
