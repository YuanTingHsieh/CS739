#!/bin/bash
clear_cache(){
	sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
}
rm -f here
dd if=/dev/zero of=here bs=1G count=1 oflag=direct
iperf -c instance-1
clear_cache


