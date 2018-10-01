#!/bin/bash
for i in {1..110}; do
	echo "Probing round $i"
	date
	sudo ceph osd df
	sleep 1
done
