import sys
from cogent_utilities import *
from datetime import datetime,timedelta
import numpy as np

first_event = 2750361.2 
# First day of data recording.
start_date = datetime(2009, 12, 3, 0, 0, 0, 0) #

infile = open(sys.argv[1])

for line in infile:
    vals = line.split()
    if len(vals)==2:
        t_sec = float(vals[0])
        amplitude = float(vals[1])

        # Convert the amplitude to an energy using a particular calibration.
        energy = amp_to_energy(amplitude,2)

        # Convert the time in seconds to a day.
        time_days = (t_sec-first_event)/(24.0*3600.0) + 1.0
        #print "%f %f" % (time_days,energy)

        #hour = 2*np.pi*(time_days%1)
        hour = 24*(time_days%1)
        day = np.ceil(time_days)

        #print "%f %f" % (hour,energy)
        #print "%f %f" % (hour,day)
        #print "%f %f %f" % (hour,day,energy)
        #print "%f %f %f %f %d" % (time_days,hour,energy,energy,1)
        #print "%f %f %f %f %d" % (time_days,hour+10,energy,energy,1)
        #print "%f %f %f %f %d" % (day,hour+10,energy,energy,1)

        theta = 2*np.pi*(day/459)
        #theta = 2*np.pi*(time_days/459.0)
        r = hour+5
        z = (energy/17)*50.0

        x = r*np.cos(theta)
        y = r*np.sin(theta)

        print "%f %f %f %f %d" % (x,y,z,z,1)
        

