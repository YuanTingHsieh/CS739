#!/bin/bash
set -x
nodes=("$@")
nodes+="instance-2 "
nodes+="instance-3 "
nodes+="instance-4 "

disks=(
  /dev/sdd
  /dev/sde
  /dev/sde
)

# Create the cluster
ceph-deploy new instance-2

# Installing nodes
ceph-deploy install $nodes


# Create  Initial monitor
ceph-deploy mon create-initial


# Copying configuration files
ceph-deploy admin $nodes

# For echo node, create
i=0
for node in $nodes; do
    ceph-deploy osd create --data ${disks[$i]}  $node
    i=$(( $i + 1 ))
done

# Check health on each instance
for node in $nodes; do
    ssh $node sudo ceph health
done

ceph-deploy mds create instance-2
ceph-deploy mon add instance-3 instance-4
ceph quorum_status --fomat json-pretty

# Add Managers
ceph-deploy mgr create instance-3 instance-4
