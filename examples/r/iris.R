#!/usr/bin/env Rscript
# Your code starts here
library(tidyverse)

iris %>%
  ggplot() +
  aes(x = Petal.Length,
      y = Petal.Width,
      colour = Species) +
  geom_point()

# Your code ends here
ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
