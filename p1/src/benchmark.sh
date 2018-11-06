sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 4096 > results_write_t16_b4096.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 8192 > results_write_t16_b8192.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 16384 > results_write_t16_b16384.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 32768 > results_write_t16_b32768.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 65536 > results_write_t16_b65536.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 131072 > results_write_t16_b131072.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 262144 > results_write_t16_b262144.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 524288 > results_write_t16_b524288.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 1048576 > results_write_t16_b1048576.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 2097152 > results_write_t16_b2097152.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 16 -t 4194304 > results_write_t16_b4194304.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 16 > results_read_seq_t16.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 16 > results_read_rand_t16.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 4096 > results_write_t32_b4096.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 8192 > results_write_t32_b8192.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 16384 > results_write_t32_b16384.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 32768 > results_write_t32_b32768.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 65536 > results_write_t32_b65536.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 131072 > results_write_t32_b131072.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 262144 > results_write_t32_b262144.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 524288 > results_write_t32_b524288.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 1048576 > results_write_t32_b1048576.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 2097152 > results_write_t32_b2097152.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 32 -t 4194304 > results_write_t32_b4194304.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 32 > results_read_seq_t32.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 32 > results_read_rand_t32.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 4096 > results_write_t64_b4096.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 8192 > results_write_t64_b8192.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 16384 > results_write_t64_b16384.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 32768 > results_write_t64_b32768.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 65536 > results_write_t64_b65536.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 131072 > results_write_t64_b131072.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 262144 > results_write_t64_b262144.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 524288 > results_write_t64_b524288.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 1048576 > results_write_t64_b1048576.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 2097152 > results_write_t64_b2097152.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 64 -t 4194304 > results_write_t64_b4194304.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 64 > results_read_seq_t64.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 64 > results_read_rand_t64.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 4096 > results_write_t128_b4096.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 8192 > results_write_t128_b8192.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 16384 > results_write_t128_b16384.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 32768 > results_write_t128_b32768.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 65536 > results_write_t128_b65536.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 131072 > results_write_t128_b131072.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 262144 > results_write_t128_b262144.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 524288 > results_write_t128_b524288.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 1048576 > results_write_t128_b1048576.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 2097152 > results_write_t128_b2097152.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 write --no-cleanup -b 128 -t 4194304 > results_write_t128_b4194304.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 seq -t 128 > results_read_seq_t128.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench 10 rand -t 128 > results_read_rand_t128.txt
sudo rados -p scbench cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 4096 > results_write_t16_b4096_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 8192 > results_write_t16_b8192_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 16384 > results_write_t16_b16384_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 32768 > results_write_t16_b32768_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 65536 > results_write_t16_b65536_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 131072 > results_write_t16_b131072_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 262144 > results_write_t16_b262144_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 524288 > results_write_t16_b524288_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 1048576 > results_write_t16_b1048576_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 2097152 > results_write_t16_b2097152_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 16 -t 4194304 > results_write_t16_b4194304_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 16 > results_read_seq_t16_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 16 > results_read_rand_t16_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 4096 > results_write_t32_b4096_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 8192 > results_write_t32_b8192_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 16384 > results_write_t32_b16384_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 32768 > results_write_t32_b32768_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 65536 > results_write_t32_b65536_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 131072 > results_write_t32_b131072_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 262144 > results_write_t32_b262144_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 524288 > results_write_t32_b524288_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 1048576 > results_write_t32_b1048576_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 2097152 > results_write_t32_b2097152_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 32 -t 4194304 > results_write_t32_b4194304_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 32 > results_read_seq_t32_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 32 > results_read_rand_t32_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 4096 > results_write_t64_b4096_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 8192 > results_write_t64_b8192_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 16384 > results_write_t64_b16384_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 32768 > results_write_t64_b32768_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 65536 > results_write_t64_b65536_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 131072 > results_write_t64_b131072_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 262144 > results_write_t64_b262144_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 524288 > results_write_t64_b524288_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 1048576 > results_write_t64_b1048576_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 2097152 > results_write_t64_b2097152_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 64 -t 4194304 > results_write_t64_b4194304_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 64 > results_read_seq_t64_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 64 > results_read_rand_t64_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 4096 > results_write_t128_b4096_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 8192 > results_write_t128_b8192_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 16384 > results_write_t128_b16384_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 32768 > results_write_t128_b32768_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 65536 > results_write_t128_b65536_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 131072 > results_write_t128_b131072_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 262144 > results_write_t128_b262144_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 524288 > results_write_t128_b524288_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 1048576 > results_write_t128_b1048576_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 2097152 > results_write_t128_b2097152_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 write --no-cleanup -b 128 -t 4194304 > results_write_t128_b4194304_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 seq -t 128 > results_read_seq_t128_n2.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench2 10 rand -t 128 > results_read_rand_t128_n2.txt
sudo rados -p scbench2 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 4096 > results_write_t16_b4096_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 8192 > results_write_t16_b8192_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 16384 > results_write_t16_b16384_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 32768 > results_write_t16_b32768_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 65536 > results_write_t16_b65536_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 131072 > results_write_t16_b131072_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 262144 > results_write_t16_b262144_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 524288 > results_write_t16_b524288_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 1048576 > results_write_t16_b1048576_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 2097152 > results_write_t16_b2097152_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 16 -t 4194304 > results_write_t16_b4194304_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 16 > results_read_seq_t16_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 16 > results_read_rand_t16_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 4096 > results_write_t32_b4096_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 8192 > results_write_t32_b8192_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 16384 > results_write_t32_b16384_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 32768 > results_write_t32_b32768_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 65536 > results_write_t32_b65536_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 131072 > results_write_t32_b131072_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 262144 > results_write_t32_b262144_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 524288 > results_write_t32_b524288_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 1048576 > results_write_t32_b1048576_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 2097152 > results_write_t32_b2097152_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 32 -t 4194304 > results_write_t32_b4194304_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 32 > results_read_seq_t32_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 32 > results_read_rand_t32_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 4096 > results_write_t64_b4096_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 8192 > results_write_t64_b8192_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 16384 > results_write_t64_b16384_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 32768 > results_write_t64_b32768_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 65536 > results_write_t64_b65536_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 131072 > results_write_t64_b131072_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 262144 > results_write_t64_b262144_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 524288 > results_write_t64_b524288_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 1048576 > results_write_t64_b1048576_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 2097152 > results_write_t64_b2097152_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 64 -t 4194304 > results_write_t64_b4194304_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 64 > results_read_seq_t64_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 64 > results_read_rand_t64_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 4096 > results_write_t128_b4096_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 8192 > results_write_t128_b8192_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 16384 > results_write_t128_b16384_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 32768 > results_write_t128_b32768_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 65536 > results_write_t128_b65536_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 131072 > results_write_t128_b131072_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 262144 > results_write_t128_b262144_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 524288 > results_write_t128_b524288_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 1048576 > results_write_t128_b1048576_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 2097152 > results_write_t128_b2097152_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 write --no-cleanup -b 128 -t 4194304 > results_write_t128_b4194304_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 seq -t 128 > results_read_seq_t128_n3.txt
sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
sudo rados bench -p scbench3 10 rand -t 128 > results_read_rand_t128_n3.txt
sudo rados -p scbench3 cleanup
