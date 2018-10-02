import matplotlib.pyplot as plt
import numpy as np
import json

filename = "./part4.json"
record_json = json.load(open(filename))

block = {}
record_dict = {}
for config in record_json.keys():
    print(config)
    one_config = record_json[config]
    for block_config in one_config.keys():
        if not block_config in record_dict:
            record_dict[block_config] = {}
        one_record = one_config[block_config]
        for col in one_record.keys():
            if not col in record_dict[block_config]:
                record_dict[block_config][col] = []
            record_dict[block_config][col].append(one_record[col])

i = 0
bar_width = 0.15
opacity = 0.8
colors = "bgrcmykw"
for k in record_dict:
    print(k)
    print(record_dict[k])
    fig = plt.figure()
    ax = plt.subplot(111)
    j = 0
    for attr in record_dict[k]:
        if 'bw' in attr:
            continue
        r = record_dict[k][attr]
        index = np.arange(len(r))
        ax.bar(index + j * bar_width, r, bar_width,
                alpha=opacity, color=colors[j],
                label=attr)
        j += 1
        #i += 1
    plt.xticks(index + bar_width, record_json.keys())
    # Shrink current axis's height by 10% on the bottom
    box = ax.get_position()
    ax.set_position([box.x0, box.y0 + box.height * 0.1,
                     box.width, box.height * 0.9])
    ax.set_ylabel('Latency (s)')
    # Put a legend below current axis
    ax.legend(loc='upper center', bbox_to_anchor=(0.5, -0.05),
              fancybox=True, shadow=True, ncol=3)
    plt.title('Latency in different cluster')
    plt.savefig("part4_lat_" + k + ".png")

for k in record_dict:
    print(k)
    print(record_dict[k])
    fig = plt.figure()
    ax = plt.subplot(111)
    j = 0
    for attr in record_dict[k]:
        if 'lat' in attr:
            continue
        r = record_dict[k][attr]
        index = np.arange(len(r))
        ax.bar(index + j * bar_width, r, bar_width,
                alpha=opacity, color=colors[j],
                label=attr)
        j += 1
        #i += 1
    plt.xticks(index + bar_width, record_json.keys())
    # Shrink current axis's height by 10% on the bottom
    box = ax.get_position()
    ax.set_position([box.x0, box.y0 + box.height * 0.1,
                     box.width, box.height * 0.9])
    ax.set_ylabel('Throughput (MB/s)')

    # Put a legend below current axis
    ax.legend(loc='upper center', bbox_to_anchor=(0.5, -0.05),
              fancybox=True, shadow=True, ncol=3)
    plt.title('Throughput in different cluster')
    plt.savefig("part4_bw_" + k + ".png")
