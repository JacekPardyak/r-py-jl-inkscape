#!/usr/bin/env python
import sys
import matplotlib.pyplot as plt
import geopandas
world = geopandas.read_file(geopandas.datasets.get_path('naturalearth_lowres'))
world.plot()
<<<<<<< HEAD
#plt.savefig(sys.argv[1], format='svg', dpi=1200)
plt.savefig("test.svg", format='svg', dpi=1200)
%pip install geopandas
#import sys
# start of your script
#import matplotlib.pyplot as plt
#import geopandas

#path_to_data = geopandas.datasets.get_path("nybb")
#gdf = geopandas.read_file(path_to_data)

#gdf
#import numpy as np
#fig, ax = plt.subplots()
#xpoints = np.array([0, 5])
#ypoints = np.array([0, 5])
#plt.plot(xpoints, ypoints)

#plt.ylabel("Y-axis ")
#plt.xlabel("X-axis ")
#plt.show()
# end of your script
#fig.savefig(sys.argv[1], format='svg', dpi=1200)
=======
plt.savefig(sys.argv[1], format='svg', dpi=1200)
>>>>>>> 952bb5dce072aeca164a287c68a706f19a75ee19
