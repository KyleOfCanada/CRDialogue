library(jsonlite)
library(tidyverse)
library(here)
library(googlesheets4)
library(lubridate)

# create list of json files
fileList <- list.files(here('data', 'jsonTranscripts'),
           full.names = TRUE,
           pattern = 'cr1-\\d+.?\\d*.json')

# create list of main cast members
castList <- c('MATT', 'TRAVIS', 'MARISHA', 'TALIESIN', 'SAM', 'LIAM', 'LAURA', 'ASHLEY')

# get gamePlay times from critrolestats

# function to strip data info and format as period
strp_date <- function(x) {
  strptime(x, '%Y-%m-%d %H:%M:%S') %>%
    str_sub( 12, -1) %>% 
    hms()
}

runTimesC1 <- read_sheet('https://docs.google.com/spreadsheets/d/1Zx1N0cQcd1fJadUwar7f2hJ2p61qoX7lctsVaIEa5uM/edit#gid=0',
                         sheet = 1,
                         col_types = 'ctttttttlttttc')[-c(1:3),] %>% 
  select(Episode, `1st start`, `1st end`, `2nd start`, `2nd end`)


runTimes <- runTimesC1 %>% 
  select(Episode, `1st start`, `1st end`, `2nd start`, `2nd end`) %>% 
  mutate(episode = str_sub(Episode, 4, 6) %>% as.numeric() %>% as.character(),
         campaign = str_sub(Episode, 2, 2) %>% as.numeric() %>% as.character(),
         across(`1st start`:`2nd end`,
                .fns = strp_date)) %>% 
  select(episode, campaign, `1st start`:`2nd end`)

# read in json data and single tibble
datC1 <- fileList %>% 
  map_dfr(function(x) {
    tmpMetadata <- read_json(x,
                             simplifyVector = TRUE)$metadata
    tmplines <- read_json(x,
              simplifyVector = TRUE)$lines
    tmplines$campaign <- tmpMetadata$campaign
    tmplines$episode <- tmpMetadata$episode
    tmplines 
  }) %>% 
  as_tibble() %>% 
  left_join(runTimes) %>% 
  mutate(ts = hms(paste(ts$h, ts$m, ts$s)),
         gamePlay = (ts >= `1st start` & ts <= `1st end`) | (ts >= `2nd start` & ts <= `2nd end`)) %>% 
  select(-`1st start`, -`1st end`, -`2nd start`, -`2nd end`) %>% 
  separate(name,
           into = paste0('name', 1:8), # as of C2E120 max of 6 simultaneously, used 8
           sep = ', ') %>% 
  pivot_longer(cols = name1:name8,
               names_to = 'x',
               values_to = 'name') %>% 
  filter(!is.na(name)) %>% 
  select(-x) %>% 
  mutate(name = ifelse((name == 'ASHLEY' & campaign == '1' & episode == '43.01')
                       | (name == 'ASHLEY' & campaign == '1' & episode == '65.01')
                       | (name == 'ASHLEY' & campaign == '1' & episode == '115.03'),
                       'ASHLY',
                       name),
         episode = ifelse(campaign == '1' & episode == '45.01',
                          '46',
                          episode),
         name = ifelse(name == 'CHRIS' & campaign == '1' & episode == '46',
                       'CHRISh',
                       name),
         mainCast = name %in% castList,
         oneShot = str_detect(episode,
                              '\\.'))

# save tidy data
saveRDS(datC1,
        here('data', 'tidyDataC1.rds'))

