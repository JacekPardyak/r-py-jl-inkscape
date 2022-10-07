from mpl_toolkits.basemap import Basemap
import numpy as np
import matplotlib.pyplot as plt
#%pip install mpl_toolkits
%pip install mpl_toolkits
# Set the plot size for this notebook:
plt.rcParams["figure.figsize"]=13,13

# Always start witht the basemap function to initialize a map
m=Basemap()
 
# Show the coast lines
m.drawcoastlines()
 
plt.show();
