#!/usr/bin/env Rscript
args = commandArgs(trailingOnly = TRUE)
# Your code starts here
library(tidyverse)

plot <- iris %>%
  ggplot() +
  aes(x = Petal.Length,
      y = Petal.Width,
      colour = Species) +
  geom_point()

# Your code ends here
ggsave(filename = args[1] , plot = plot)
