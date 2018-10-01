import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np

filename = "part3.log"
hdds = 3
hdd_logs = []
for h in range(hdds):
    hdd_dict = {}
    hdd_dict["Use"] = []
    hdd_logs.append(hdd_dict)

valid_line_len = 8
use_index = 6
hdd_count = 0
second_count = 0
parseField = True
f = open(filename)
for l in f.read().splitlines():
    segs = l.split()
    if len(segs) <= valid_line_len:
        continue
    if not parseField:
        hdd_logs[hdd_count]["Use"].append(float(segs[use_index]))
        hdd_count += 1
        if hdd_count >= hdds:
            parseField = True
            hdd_count = 0
    else:
        second_count += 1
        parseField = False
f.close()

plt.plot(np.arange(second_count), hdd_logs[0]["Use"], '-b', label='hdd0')
plt.plot(np.arange(second_count), hdd_logs[1]["Use"], '-g', label='hdd1')
plt.plot(np.arange(second_count), hdd_logs[2]["Use"], '-r', label='hdd2')
plt.legend(loc='upper left')
plt.xlabel('Time (s)')
plt.ylabel('Disk Usage (GiB)')
plt.savefig("disk.png")
plt.show()
