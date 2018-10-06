#!/bin/bash
set -x
nodes=("$@")
nodes+="instance-2 "
nodes+="instance-3 "
nodes+="instance-4 "


ceph-deploy purge $nodes
ceph-deploy purgedata $nodes
ceph-deploy forgetkeys
rm ceph.*




