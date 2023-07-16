#!/usr/bin/env Rscript
library(dplyr)
n = 50000 # number of points

# SVG graphics device
svg(filename = commandArgs(trailingOnly = TRUE)[1])
par(bg="black") 
par(mar=c(0,0,0,0)) 
tibble(u = runif(n)) %>%
  mutate(v = runif(n)) %>%
  mutate(x = cos(2*pi*u)*sqrt(-2*log(v))) %>%
  mutate(y = sin(2*pi*v)*sqrt(-2*log(u))) %>%
  select(x, y) %>%
  plot(pch = ".", col = "blue", cex  =1.2, axes = FALSE)
dev.off() 
