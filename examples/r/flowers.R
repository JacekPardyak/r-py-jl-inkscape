#!/usr/bin/env Rscript
# Your code starts here

if (!require("ggwordcloud"))
  install.packages("ggwordcloud")
if (!require("tidytext"))
  install.packages("tidytext")

library(tidyverse) # general meta package
library(ggwordcloud) # for world cloud
library(tidytext) # for NLP
"https://gist.githubusercontent.com/researchranks/ffe24c33df30e64f51271ddec83b4af6/raw/0e15dabe9b54611288cf92f93e1bfa288e150448/flower-and-plant-names.csv" %>%
  read_csv(col_names = FALSE) %>%
  mutate(linenumber = row_number()) %>%
  unnest_tokens(word, X1)  %>%
  count(word, sort = T) %>%
  top_n(200) %>%
  ggplot() +
  geom_text_wordcloud_area(aes(label = word, size = n)) +
  scale_size_area(max_size = 15)

# Your code ends here
ggsave(filename = commandArgs(trailingOnly = TRUE)[1])
