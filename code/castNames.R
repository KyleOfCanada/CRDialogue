library(tidyverse)
library(tidytext)
library(textdata)
library(circlize)
library(here)

#### load tidy data ####

dat <- readRDS(here('data', 'tidyData.rds'))


#### cast names ####

castNames <- str_to_lower(c('MATT', 'TRAVIS', 'MARISHA', 'TALIESIN', 'SAM', 'LIAM', 'LAURA', 'ASHLEY'))

namesSpoken <- dat %>% 
  filter(mainCast) %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>%
  filter(word %in% castNames) %>% 
  mutate(across(name:word,
                str_to_title)) %>% 
  group_by(name) %>% 
  count(word)
  
chordDiagramFromDataFrame(namesSpoken)
