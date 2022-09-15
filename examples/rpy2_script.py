#!/usr/bin/env python
import sys
path = sys.argv[1]
import rpy2
import rpy2.robjects as robjects
robjects.r('''
library(tidyverse)

py.path
iris %>%
  ggplot() +
  aes(x = Petal.Length,
      y = Petal.Width,
      colour = Species) +
  geom_point()

# Your code ends here
#ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
ggsave(filename = 'test.svg')
        
         ''')
        
