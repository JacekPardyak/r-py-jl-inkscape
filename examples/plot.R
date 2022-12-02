#!/usr/bin/env Rscript
library(magrittr)
library(igraph)

# SVG graphics device
svg(filename = commandArgs(trailingOnly = TRUE)[1])
par(bg="black")
sample(0:1, 100, replace=TRUE, prob=c(0.8,0.2)) %>%
  matrix(nc=10) %>%
  graph_from_adjacency_matrix(mode='undirected', diag=F ) %>%
  plot(
     # === vertex
     vertex.color = rgb(0.8,0.4,0.3,0.8),          # Node color
     vertex.frame.color = "white",                 # Node border color
     vertex.shape="circle",                        # One of “none”, “circle”, “square”, “csquare”, “rectangle” “crectangle”, “vrectangle”, “pie”, “raster”, or “sphere”
     vertex.size=14,                               # Size of the node (default is 15)
     vertex.size2=NA,                              # The second size of the node (e.g. for a rectangle)
     
     # === vertex label
     vertex.label=LETTERS[1:10],                   # Character vector used to label the nodes
     vertex.label.color="white",
     vertex.label.family="Times",                  # Font family of the label (e.g.“Times”, “Helvetica”)
     vertex.label.font=2,                          # Font: 1 plain, 2 bold, 3, italic, 4 bold italic, 5 symbol
     vertex.label.cex=1,                           # Font size (multiplication factor, device-dependent)
     vertex.label.dist=0,                          # Distance between the label and the vertex
     vertex.label.degree=0 ,                       # The position of the label in relation to the vertex (use pi)
     
     # === Edge
     edge.color="white",                           # Edge color
     edge.width=4,                                 # Edge width, defaults to 1
     edge.arrow.size=1,                            # Arrow size, defaults to 1
     edge.arrow.width=1,                           # Arrow width, defaults to 1
     edge.lty="solid",                             # Line type, could be 0 or “blank”, 1 or “solid”, 2 or “dashed”, 3 or “dotted”, 4 or “dotdash”, 5 or “longdash”, 6 or “twodash”
     edge.curved=0.3    ,                          # Edge curvature, range 0-1 (FALSE sets it to 0, TRUE to 0.5)
)
# Close the graphics device
dev.off() 
