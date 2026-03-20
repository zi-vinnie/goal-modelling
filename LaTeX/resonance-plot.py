# script to illustrate resonance and near resonance

import numpy as np
import matplotlib.pyplot as pl

omega0 = 1.0     # natural frequency
omega = 1.1      # forcing frequency
gamma = 1.0      # forcing amplitude

t = np.linspace(1, 200, 2000)

if omega == omega0:        # exact resonance
    x = 0.5/omega * ( 1.0/omega * np.sin(omega*t) - t * np.cos(omega*t)) 
else:                      # otherwise ...
    x = 1.0/(omega0**2 - omega**2)*(np.sin(omega*t) - omega/omega0 * np.sin(omega0*t))

pl.plot(t,x) 
pl.show()     # close plot window to rerun
