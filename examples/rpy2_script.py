#!/usr/bin/env python
import sys
import rpy2.robjects as robjects

robjects.r('''
# Your R code starts here
library(tidyverse)
plot_and_save <- function(x) {
  iris %>%
    ggplot() +
    aes(x = Petal.Length,
        y = Petal.Width,
        colour = Species) +
    geom_point()

# Your R code ends here
ggsave(x)
    }
''')

<<<<<<< HEAD
# Your code ends here
#ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
ggsave(filename = 'test3.svg')
        
         ''')
=======
plot_and_save_r = robjects.globalenv['plot_and_save']
plot_and_save_r(sys.argv[1])
>>>>>>> a77d0f7dca832376a60a18ca9ddd57d978819915
        
