#!/usr/bin/env Rscript
# Your code starts here
if(! require("ggraph") ) install.packages("ggraph")
if(! require("tidygraph") ) install.packages("tidygraph")
library(tidygraph)
library(ggraph)

dendrogram <- hclust(dist(iris[, 1:4]))
ggraph(dendrogram, 'dendrogram', circular = TRUE) + 
  geom_edge_elbow() + 
  coord_fixed()

# Your code ends here
ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
