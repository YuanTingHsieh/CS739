#!/bin/bash
sudo ./rewrite_cords.py --data_dirs /var/lib/ceph/osd/ceph-0 --trace_files /home/ceph-admin/trace --workload_command "/usr/bin/python /home/ceph-admin/CORDS/ceph_workload_read.py"
