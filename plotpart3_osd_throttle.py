import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import json

t10file = "part3_throttle_t10.log"
t100file = "part3_throttle_t100.log"

def parse_logs(filename):
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
            logs.append(byte // (1024*1024))
            jsonStr = ''
        elif parseJson:
          jsonStr += l + '\n'
    f.close()
    return logs, second_count

logs_t10, second_count = parse_logs(t10file)
logs_t100, second_count = parse_logs(t100file)

plt.plot(np.arange(second_count), logs_t10, '-b', label='-t 10')
plt.plot(np.arange(second_count), logs_t100, '-g', label='-t 100')
plt.title('OSD Throttle Client Bytes vs Seconds')
plt.legend(loc='upper left')
plt.xlabel('Time (s)')
plt.ylabel('OSD Throttle Client (MB)')
plt.savefig("OSD_throttle.png")
plt.show()
