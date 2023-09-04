#!/usr/bin/env Rscript
file = commandArgs(trailingOnly = TRUE)[1]
library(reticulate)
#Sys.setenv(RETICULATE_MINICONDA_PATH = 'C:/Users/Public/r-miniconda')
reticulate::repl_python()

# your python code starts here
import matplotlib.pyplot as plt
import numpy as np

# Data for plotting
#t = np.arange(0.0, 2.0, 0.01)
#s = 1 + np.sin(2 * np.pi * t)

N = 400
t = np.linspace(0, 2 * np.pi, N)
rad = 0.5 + np.cos(t)
x, y = rad * np.cos(t), rad * np.sin(t)

fig, ax = plt.subplots()
ax.plot(x, y, "k")

#output = ax.set(xlabel='time (s)', ylabel='voltage (mV)', title='About as simple as it gets, folks')
ax.grid()
ax.set(aspect=1)
# your python code ends here
fig.savefig(r.file, format='svg', dpi=1200)
exit
