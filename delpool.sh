sudo ceph tell mon.\* injectargs '--mon-allow-pool-delete=true'
sudo ceph osd pool rm testpool testpool --yes-i-really-really-mean-it
