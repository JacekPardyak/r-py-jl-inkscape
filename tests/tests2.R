#!/usr/bin/env Rscript
args = commandArgs(trailingOnly = TRUE)[1]
reticulate::repl_python()
# your python code starts here
%pip install rpy2

#%pip install matplotlib


import geopandas 
world = geopandas.read_file(geopandas.datasets.get_path('naturalearth_lowres'))
fig = world.plot();

# your python code ends here
fig.savefig(r.args, format='svg', dpi=1200)
exit

# -------------------------------
library(tidyverse)
mtcars %>% ggplot() +
  aes(x=wt, y=mpg, col=factor(cyl)) +
  geom_point() +
  geom_smooth(aes(group = cyl),
                      method = 'lm')

pp.plot()
