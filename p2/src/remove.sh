#!/bin/bash
set -x
nodes=("$@")
nodes+="vm2 "
nodes+="vm3 "
nodes+="vm4 "

ssh vm2 sudo killall errfs
ssh vm2 sudo systemctl stop ceph-osd@0
ssh vm3 sudo systemctl stop ceph-osd@1
ssh vm4 sudo systemctl stop ceph-osd@2
ssh vm2 sudo umount /var/lib/ceph/osd/*
ssh vm2 sudo ceph-volume lvm zap /dev/sdb
ssh vm3 sudo ceph-volume lvm zap /dev/sdb
ssh vm4 sudo ceph-volume lvm zap /dev/sdb
ceph-deploy purge $nodes
ceph-deploy purgedata $nodes
ceph-deploy forgetkeys
ssh vm2 ./clear_lvm.py
ssh vm3 ./clear_lvm.py
ssh vm4 ./clear_lvm.py

rm ceph.*




