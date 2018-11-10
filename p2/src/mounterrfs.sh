#!/bin/bash
ulimit -n 65536
sudo truncate -s 0 ppop
sudo /home/ceph-admin/CORDS/errfs -f -oallow_other,modules=subdir,subdir=/var/lib/ceph/osd/ceph-0 /var/lib/ceph/osd/ceph-0.mp trace ./ppop
