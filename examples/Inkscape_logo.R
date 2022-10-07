#!/usr/bin/env Rscript
# Your code starts here
if(! require("devtools") ) install.packages("devtools")
if(! require("inkscaper") ) devtools::install_github("JacekPardyak/inkscaper")
library(tidyverse)
library(sf)
'https://upload.wikimedia.org/wikipedia/commons/a/a2/Inkscape_logo_%282-colour%29.svg' %>%
  inx_svg2sf() %>%
  mutate(colour = rainbow(nrow(.))) %>%
  ggplot() +
  geom_sf(aes(colour = colour), size = 2) +
  scale_colour_identity() +
  theme_light()

# Your code ends here
ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
