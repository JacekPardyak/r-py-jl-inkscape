#!/usr/bin/env python
import sys
import matplotlib.pyplot as plt
import geopandas
world = geopandas.read_file(geopandas.datasets.get_path('naturalearth_lowres'))
world.plot()
plt.savefig(sys.argv[1], format='svg', dpi=1200)
