#!/usr/bin/env Rscript
args = commandArgs(trailingOnly = TRUE)[1]
reticulate::repl_python()
# your python code starts here
import matplotlib.pyplot as plt
import numpy as np

# Data for plotting
t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2 * np.pi * t)

fig, ax = plt.subplots()
ax.plot(t, s)

output = ax.set(xlabel='time (s)', ylabel='voltage (mV)',
                title='About as simple as it gets, folks')
ax.grid()

# your python code ends here
fig.savefig(r.args, format='svg', dpi=1200)
exit
