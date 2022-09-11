#!/usr/bin/env Rscript
args = commandArgs(trailingOnly = TRUE)[1]
reticulate::repl_python()
# your python code starts here
%pip install geopandas
import geopandas 
world = geopandas.read_file(geopandas.datasets.get_path('naturalearth_lowres'))
fig = world.plot();

# your python code ends here
fig.savefig(r.args, format='svg', dpi=1200)
exit
