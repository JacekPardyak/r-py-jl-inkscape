#!/usr/bin/env Rscript
# Your code starts here

# libraries
library(tidyverse)
# H-Fractal Parameters
p <- 10 ## Number of iterations
a <- 1 / sqrt(2) ## Shortening parameter

# Define horizontal starting line
h_fractal <- data.frame(x1 = -1,
                        y1 = 0,
                        x2 = 1,
                        y2 = 0,
                        m = 0)
# Generate coordinates (each line on a row)
for (m in 1:p) {
  ## Flip direction
  dx <- (m - 1) %% 2
  dy <- m %% 2
  # Previous and current line numbers
  i <- (2^(m - 1)):(2^m - 1)
  j <- (2^m):(2^(m + 1) - 1)
  ## Calculate coordinates
  h_fractal[j, "x1"] <- c(h_fractal[i, "x1"] - dx * a^m, h_fractal[i, "x2"] - dx * a^m)
  h_fractal[j, "x2"] <- c(h_fractal[i, "x1"] + dx * a^m, h_fractal[i, "x2"] + dx * a^m)
  h_fractal[j, "y1"] <- c(h_fractal[i, "y1"] - dy * a^m, h_fractal[i, "y2"] - dy * a^m)
  h_fractal[j, "y2"] <- c(h_fractal[i, "y1"] + dy * a^m, h_fractal[i, "y2"] + dy * a^m)
  ## Set line property
  h_fractal[j, "m"] <- m
}
# Plot
h_fractal %>% ggplot() + 
  aes(x = x1, y = y1, xend = x2, yend = y2, col = m) +
  geom_segment(size = .5) +
  scale_size(guide = NULL) +
  scale_colour_gradientn(colours = gray.colors(p), guide = NULL) + 
  theme_void() 

# Your code ends here
ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
