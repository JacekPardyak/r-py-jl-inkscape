#!/usr/bin/env python
import sys
import rpy2.robjects as robjects

robjects.r('''
# Your R code starts here
library(tidyverse)
plot_and_save <- function(x) {
mtcars %>% ggplot() +
  aes(x=wt, y=mpg, col=factor(cyl)) +
  geom_point() +
  geom_smooth(aes(group = cyl),
                      method = 'lm')
# Your R code ends here
ggsave(x)
    }
''')

plot_and_save_r = robjects.globalenv['plot_and_save']
plot_and_save_r(sys.argv[1])
 
