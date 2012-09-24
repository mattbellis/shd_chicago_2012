import numpy as np
import matplotlib.pylab as plt

import sys

infile = open(sys.argv[1])

xpts = np.array([])
ypts = np.array([])
zpts = np.array([])

for line in infile:
    vals = line.split()

    xpts = np.append(xpts,float(vals[0]))
    ypts = np.append(ypts,float(vals[1]))
    zpts = np.append(zpts,float(vals[2]))

plt.figure(figsize=(6,6),dpi=100)
#plt.ax = plt.subplot(111, polar=True)
#plt.plot(xpts,ypts,'o',markersize=1)
count = 1
#centry = (zpts/16)*255
#color = (centry,centry,centry)
#plt.scatter(xpts,ypts,'o',s=zpts/5,facecolor=color)
#'''
for x,y,z in zip(xpts,ypts,zpts):
    #print z
    #centry = 1.0-(z/17)
    #centry = z/17
    centry = 0.5
    color = (centry,centry,centry)
    #print color
    plt.plot(x,y,'o',markersize=z/5,color=str(centry))
    #plt.scatter(x,y,'o',s=np.array([5]),facecolor=color)
    #plt.scatter(x,y,'o')
    count += 1
    #'''
    if count>100:
        break
    #'''
#'''

plt.show()
   
