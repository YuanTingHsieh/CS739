sudo ceph osd pool create testpool 100
sudo ceph osd pool set testpool min_size 3
sudo rbd pool init testpool
