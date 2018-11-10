#!/bin/bash
ulimit -n 65536
sudo truncate -s 0 /home/ceph-admin/trace
sudo ./trace.py --data_dirs /var/lib/ceph/osd/ceph-0 --trace_files /home/ceph-admin/trace --workload_command "python ceph_workload_read.py" --ignore_file ignore_fewer
#sudo ./trace.py --data_dirs /var/lib/ceph/osd/ceph-0 --trace_files /home/ceph-admin/trace --workload_command "python ceph_workload_read.py"
