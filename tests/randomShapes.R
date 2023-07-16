#!/usr/bin/env Rscript
#set.seed(345)
library(tidyverse)
library(RColorBrewer)
ngroup=30
years = 40

val = c()
for(i in c(1:years)){
  val = c(val, prop.table(sample( c(rep(0,100),c(1:ngroup)) , ngroup)))}
DAT = expand.grid(1:ngroup, 1:years) %>% 
  rename(Year = Var2, Group = Var1) %>%
  mutate(Group = paste('G', Group, sep = "_")) %>% 
  add_column(Value = val)


coul = brewer.pal(12, "Paired") 
coul = colorRampPalette(coul)(ngroup)
coul = coul[sample(c(1:length(coul)) , size=length(coul) ) ]
DAT %>% 
  ggplot(aes(x=Year, y=Value, fill=Group )) + 
  geom_area(alpha=1, show.legend = FALSE)+
  scale_fill_manual(values = coul)+
  theme_void()
# Your code ends here
ggsave(filename = commandArgs(trailingOnly = TRUE)[1])


