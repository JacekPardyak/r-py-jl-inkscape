#!/usr/bin/env Rscript
file = commandArgs(trailingOnly = TRUE)[1]
library(reticulate)
py_install("matplotlib")
Sys.getenv("RETICULATE_MINICONDA_PATH")
reticulate::repl_python()
import matplotlib.pyplot as plt
import matplotlib.tri as tri
import numpy as np

# First create the x and y coordinates of the points.
n_angles = 36
n_radii = 8
min_radius = 0.25
radii = np.linspace(min_radius, 0.95, n_radii)

angles = np.linspace(0, 2 * np.pi, n_angles, endpoint=False)
angles = np.repeat(angles[..., np.newaxis], n_radii, axis=1)
angles[:, 1::2] += np.pi / n_angles

x = (radii * np.cos(angles)).flatten()
y = (radii * np.sin(angles)).flatten()

# Create the Triangulation; no triangles so Delaunay triangulation created.
triang = tri.Triangulation(x, y)

# Mask off unwanted triangles.
triang.set_mask(np.hypot(x[triang.triangles].mean(axis=1),
                         y[triang.triangles].mean(axis=1))
                < min_radius)

fig, ax = plt.subplots()
ax.set_aspect('equal')
ax.triplot(triang, 'bo-', lw=1)
ax.set_title('triplot of Delaunay triangulation')
# your python code ends here
fig.savefig(r.file, format='svg', dpi=1200)
exit
