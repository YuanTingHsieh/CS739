#!/bin/bash
clear_cache(){
	sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
}
clear_cache

sudo rados bench -p scbench 10 write --no-cleanup

#clear_cache
#rados bench -p scbench 10 seq

#clear_cache
#rados bench -p scbench 10 rand
#clear_cache






