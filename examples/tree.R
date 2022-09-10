#!/usr/bin/env Rscript
args = commandArgs(trailingOnly = TRUE)
# Your code starts here

if(! require("ggraph") ) install.packages("ggraph")
if(! require("igraph") ) install.packages("igraph")

# libraries
library(ggraph)
library(igraph)
library(tidyverse)

# create an edge list data frame giving the hierarchical structure of your individuals
d1 <- data.frame(from="origin", to=paste("group", seq(1,5), sep=""))
d2 <- data.frame(from=rep(d1$to, each=5), to=paste("subgroup", seq(1,25), sep="_"))
edges <- rbind(d1, d2)

# Create a graph object 
mygraph <- graph_from_data_frame( edges )

# Basic tree
ggraph(mygraph, layout = 'dendrogram', circular = FALSE) + 
  geom_edge_diagonal() +
  geom_node_point() +
  theme_void()

# Your code ends here
ggsave(filename = args[1])
