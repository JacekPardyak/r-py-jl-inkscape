#!/usr/bin/env python
import sys
# start of your script
import matplotlib.pyplot as plt
import numpy as np

fig, ax = plt.subplots()
xpoints = np.array([0, 5])
ypoints = np.array([0, 5])
plt.plot(xpoints, ypoints)

plt.ylabel("Y-axis ")
plt.xlabel("X-axis ")
#plt.show()
# end of your script
fig.savefig(sys.argv[1], format='svg', dpi=1200)
