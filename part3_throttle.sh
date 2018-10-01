#!/bin/bash
for i in {1..10}; do
	echo "Probing round $i"
	date
	sudo ceph daemon osd.0 perf dump throttle-osd_client_bytes
	sleep 1
done
