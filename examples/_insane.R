#!/usr/bin/env Rscript
args = commandArgs(trailingOnly = TRUE)
# Your code starts here
library(tidyverse)
if (!require("inkscaper")) devtools::install_github("JacekPardyak/inkscaper")
library(inkscaper)

#"examples/eastern-motive-P4G-simple.svg" 
"https://gitlab.com/inkscape/inkscape/-/raw/master/share/examples/eastern-motive-P4G.svg" %>%
  inx_actions(actions = "select-all; selection-ungroup; object-to-path", ext = ".svg") %>%
  inx_svg2sf() %>% 
  ggplot() +
  geom_sf()

# Your code ends here
ggsave(filename = args[1])
