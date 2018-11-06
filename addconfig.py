import sys
import os

if (len(sys.argv) != 3):
    print "Usage: python addconfig.py [newfilename] [osd_id]"
    assert(len(sys.argv) == 3)

filename = '/etc/ceph/ceph.conf'
newfilename = sys.argv[1]
osd_id = sys.argv[2]


f = open(filename, 'r')
newf = open('./fuck', 'w')
tempf = open('./tempconfig', 'w')
for l in f.read().splitlines():
    tempf.write(l + '\n')
    newf.write(l + '\n')

newf.write('[osd.' + osd_id + ']\n')
newf.write('osd data = /var/lib/ceph/osd/ceph-' + osd_id + '.mp\n')
newf.write('osd max object name len = 256\n')
newf.write('osd max object namespace len = 64\n')
f.close()
newf.close()
tempf.close()

os.system('sudo cp ./fuck ' + newfilename)
