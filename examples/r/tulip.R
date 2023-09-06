#!/usr/bin/env Rscript
# Your code starts here
library(tidyverse)
library(sf)

"https://service.pdok.nl/cbs/gebiedsindelingen/2023/wfs/v1_0?request=GetFeature&service=WFS&version=2.0.0&typeName=gemeente_gegeneraliseerd&outputFormat=json" %>%
  st_read() %>%
  ggplot() +
  geom_sf() +
  theme_void()

# Your code ends here
ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
