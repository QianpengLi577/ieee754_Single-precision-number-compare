import numpy as np
import struct

rnd1=np.loadtxt('rnd1hex.txt',dtype='str',delimiter='\n')
r1=np.zeros(rnd1.shape[0])
for i in range(rnd1.shape[0]):
    r1[i]=struct.unpack('!f', bytes.fromhex(rnd1[i]))[0]

rnd2=np.loadtxt('rnd2hex.txt',dtype='str',delimiter='\n')
r2=np.zeros(rnd2.shape[0])
for i in range(rnd2.shape[0]):
    r2[i]=struct.unpack('!f', bytes.fromhex(rnd2[i]))[0]

cmp=np.loadtxt('compare.txt',dtype='str',delimiter='\n')
c=np.zeros(cmp.shape[0])
for i in range(cmp.shape[0]):
    c[i]=struct.unpack('!f', bytes.fromhex(cmp[i]))[0]

cp=(r1>r2).astype(np.float32)

print(abs(cp-c).max())

