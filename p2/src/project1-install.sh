#!/bin/bash

set -x
echo deb https://download.ceph.com/debian-mimic/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
sudo apt update
sudo apt install ceph-deploy

nodes=("$@")
nodes+="vm2 "
nodes+="vm3 "
nodes+="vm4 "

# Create the cluster
ceph-deploy new vm2

# Installing nodes
ceph-deploy install $nodes


# Create  Initial monitor
ceph-deploy mon create-initial


# Copying configuration files
ceph-deploy admin $nodes

# For echo node, create
for node in $nodes; do
#ceph-deploy osd create --data /dev/sdb  --journal /home/ceph-admin/journal $node
ceph-deploy osd create --data /dev/sdb --journal /dev/sdc1 --filestore $node
done

# Check health on each instance
for node in $nodes; do
ssh $node sudo ceph health
done

ceph-deploy mds create vm2
ceph-deploy mon add vm3 vm4
ceph quorum_status --fomat json-pretty

# Add Managers
ceph-deploy mgr create vm3 vm4
