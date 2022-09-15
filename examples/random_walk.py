#!/usr/bin/env python
import sys
# start of your script
import numpy as np
import matplotlib.pyplot as plt

WALK_LENGTH = 1_000
random_signs = np.random.choice([-1,1], WALK_LENGTH)
random_signs[0] = 0
random_walk = random_signs.cumsum()
fig, ax = plt.subplots()
plt.plot(random_walk)
# end of your script
fig.savefig(sys.argv[1], format='svg', dpi=1200)
