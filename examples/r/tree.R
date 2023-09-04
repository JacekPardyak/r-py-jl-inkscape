#!/usr/bin/env Rscript
# Your code starts here
if(! require("ggraph") ) install.packages("ggraph")
if(! require("tidygraph") ) install.packages("tidygraph")
library(tidygraph)
library(ggraph)

create_tree(n = 100, children = 3) %>% 
  ggraph(layout = 'dendrogram', circular = TRUE) + 
  geom_edge_diagonal() + 
  geom_node_point()

# Your code ends here
ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
