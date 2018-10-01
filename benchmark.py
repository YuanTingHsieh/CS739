#!/usr/bin/python
import subprocess
import os


cmd = dict()



def cleanup():

    todo = cmd["cleanup"]
    process = subprocess.Popen(todo,stdout=subprocess.PIPE,shell=True,universal_newlines=True)
    out ,err = process.communicate()
 


def clear_cache():
    todo = cmd["clear"]
    process = subprocess.Popen(todo,stdout=subprocess.PIPE,shell=True,universal_newlines=True)
    out ,err = process.communicate()
    #print "output = ",out,"err = ", err

def create_bench(pg_num,pgp_num):
    todo = cmd["clear"] %(pg_num,pgp_num)
    process = subprocess.Popen(todo,stdout=subprocess.PIPE,shell=True,universal_newlines=True)

def bench_write(seconds):
    todo= cmd["bench_write"]%seconds
    process = subprocess.Popen(todo,stdout=subprocess.PIPE,shell=True,universal_newlines=True)


thread_count = [1,2,4,8,16,32,64,128]
block_size = [ 1 ,2,4,8,16,32,64,128,256,512,1024]


def bench_read(thr_num):
    print "clearing cache"
    clear_cache()
    print "cache cleared"
   
    todo = cmd["bench_read_seq"] % (10,thr_num,thr_num)
    print "testing read seq with parameter thread = %d"%(thr_num) 
    
    process = subprocess.Popen(todo,stdout=subprocess.PIPE,shell=True,universal_newlines=True)
    process.communicate()


   
    print "clearing cache"
    clear_cache()
    print "cache cleared"
    
    todo = cmd["bench_read_rand"] % (10,thr_num,thr_num)
    print "testing read rand with parameter thread = %d"%(thr_num) 
    
    process = subprocess.Popen(todo,stdout=subprocess.PIPE,shell=True,universal_newlines=True)
    process.communicate()



def bench_param(thr_num, blk_num):
    
    cleanup()
    print "clearing cache"
    clear_cache()
    print "cache cleared"
    
    todo = cmd["bench_param"] % (10,thr_num,blk_num*4096,thr_num,blk_num*4096)
    print "testing write with parameter thread = %d , blk_num = %d"%(thr_num,blk_num * 4096) 
    
    process = subprocess.Popen(todo,stdout=subprocess.PIPE,shell=True,universal_newlines=True)
    process.communicate()
    bench_read(thr_num)
    cleanup()

thread_count = [16,32,64,128]
block_size = [ 1 ,2,4,8,16,32,64,128,256,512,1024]


def main():
    cmd["clear"] = "sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync"
    cmd["create"] = "sudo ceph osd pool create scbench %d %d"
    cmd["bench_write"] = "sudo rados bench -p scbench %d write --no-cleanup"
    cmd["bench_param"] = "sudo rados bench -p scbench %d write --no-cleanup -t %d -b %d > results_write_t%d_b%d.txt"
    cmd["bench_read_seq"] = "sudo rados bench -p scbench %d seq -t %d > results_read_seq_t%d.txt"
    cmd["bench_read_rand"] = "sudo rados bench -p scbench %d rand -t %d > results_read_rand_t%d.txt"
    cmd["cleanup"] = "sudo rados -p scbench cleanup"


    for thr_num in thread_count:
        for blk_size in block_size:
            bench_param(thr_num,blk_size)

    cmd["clear"] = "sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync"
    cmd["create"] = "sudo ceph osd pool create scbench2 %d %d"
    cmd["bench_write"] = "sudo rados bench -p scbench2 %d write --no-cleanup"
    cmd["bench_param"] = "sudo rados bench -p scbench2 %d write --no-cleanup -t %d -b %d > results_write_t%d_b%d_n2.txt"
    cmd["bench_read_seq"] = "sudo rados bench -p scbench2 %d seq -t %d > results_read_seq_t%d_n2.txt"
    cmd["bench_read_rand"] = "sudo rados bench -p scbench2 %d rand -t %d > results_read_rand_t%d_n2.txt"
    cmd["cleanup"] = "sudo rados -p scbench2 cleanup"


    for thr_num in thread_count:
        for blk_size in block_size:
            bench_param(thr_num,blk_size)

    cmd["clear"] = "sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync"
    cmd["create"] = "sudo ceph osd pool create scbench3 %d %d"
    cmd["bench_write"] = "sudo rados bench -p scbench3 %d write --no-cleanup"
    cmd["bench_param"] = "sudo rados bench -p scbench3 %d write --no-cleanup -t %d -b %d > results_write_t%d_b%d_n3.txt"
    cmd["bench_read_seq"] = "sudo rados bench -p scbench3 %d seq -t %d > results_read_seq_t%d_n3.txt"
    cmd["bench_read_rand"] = "sudo rados bench -p scbench3 %d rand -t %d > results_read_rand_t%d_n3.txt"
    cmd["cleanup"] = "sudo rados -p scbench3 cleanup"


    for thr_num in thread_count:
        for blk_size in block_size:
            bench_param(thr_num,blk_size)




main()
#bench_param(1,1)

