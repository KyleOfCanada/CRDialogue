library(tidyverse)
library(tidytext)
library(textdata)
library(circlize)
library(here)

#### load tidy data ####

datC1 <- readRDS(here('data', 'tidyDataC1.rds'))
datC2 <- readRDS(here('data', 'tidyDataC2.rds'))
dat <- bind_rows(datC1, datC2)


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
