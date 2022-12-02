#!/usr/bin/env Rscript
if(! require('keras') ) install.packages('keras')
if(! require('tidyverse') ) install.packages('tidyverse')
if(! require('ggpubr') ) install.packages('ggpubr')
if(! require('raster') ) install.packages('raster')
if(! require('png') ) install.packages('png')

library(tidyverse)
library(ggpubr)
library(keras)
library(raster)
setwd("C://Users//jacek//OneDrive//Documents//r-py-inkscape//examples//mnist//")
# load trained model
model <- load_model_tf("mnist_model")
# prepare new data
scale_me <- function(x){x/255}
file = tempfile(fileext = ".png") #file = "sample.png"
# convert to png
file %>% {sprintf(fmt = "inkscape --export-filename=%s -h 28 sample.svg", .)} %>%
  system()
#make a plot
file %>% raster() %>% as.matrix() %>% scale_me() %>% array(dim = c(1, 28, 28, 1)) %>%
  predict(object = model, x = .) %>% t() %>% as_tibble() %>% rename(probability = V1) %>% 
  mutate(class = row_number() - 1) %>% mutate(class = as.factor(class)) %>%
  ggplot() +
  background_image(png::readPNG(file)) +
  aes(x = class, y = probability) +
  geom_bar(stat="identity", fill = "red", alpha = 0.7)

ggsave(filename = commandArgs(trailingOnly = TRUE)[1])

# Referneces
# https://inkscape.org/doc/inkscape-man-1.2.x.html