import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import json

t10file = "part3_throttle_t10.log"
t100file = "part3_throttle_t100.log"
seqfile = "part3_throttle_seq_t16_b4M.log"
randfile = "part3_throttle_rand_t16_b4M.log"

def parse_logs(filename, units):
    logs = []
    parseJson = False
    jsonStr = ''
    second_count = 0
    f = open(filename)
    for l in f.read().splitlines():
        if not parseJson and l[0] == '{':
            parseJson = True
            jsonStr += l + '\n'
            second_count += 1
        elif parseJson and l[0] == '}':
            parseJson = False
            jsonStr += l + '\n'
            obj = json.loads(jsonStr)
            byte = obj['throttle-osd_client_bytes']['val']
            logs.append(byte // units)
            jsonStr = ''
        elif parseJson:
          jsonStr += l + '\n'
    f.close()
    return logs, second_count

logs_t10, second_count = parse_logs(t10file, (1024*1024))
logs_t100, second_count = parse_logs(t100file, (1024*1024))
logs_seq, second_count_read = parse_logs(seqfile, 1)
logs_rand, second_count_read = parse_logs(randfile, 1)

plt.figure(1)
plt.plot(np.arange(second_count), logs_t10, '-b', label='-t 10')
plt.plot(np.arange(second_count), logs_t100, '-g', label='-t 100')
plt.title('OSD Throttle Client Bytes vs Time')
plt.legend(loc='upper left')
plt.xlabel('Time (s)')
plt.ylabel('OSD Throttle Client (MB)')
plt.savefig("OSD_throttle_write.png")

plt.figure(2)
plt.plot(np.arange(second_count_read), logs_seq, '-b', label='seq')
plt.plot(np.arange(second_count_read), logs_rand, '-g', label='rand')
plt.title('OSD Throttle Client Bytes vs Time')
plt.legend(loc='upper left')
plt.xlabel('Time (s)')
plt.ylabel('OSD Throttle Client (Bytes)')
plt.savefig("OSD_throttle_read.png")
