library(tidyverse)
library(here)
library(googlesheets4)
library(lubridate)
library(youtubecaption)

# TODO: 
#       save data


URLs <- c('https://www.youtube.com/watch?v=-ijPD6yNdMs',
          'https://www.youtube.com/watch?v=Hjucx2vz5Mg',
          'https://www.youtube.com/watch?v=YDHxT4UT8NI',
          'https://www.youtube.com/watch?v=qAhw51d3cGw',
          'https://www.youtube.com/watch?v=Bj0Jd5mzLsI',
          'https://www.youtube.com/watch?v=sLxUyJWXA0w',
          'https://www.youtube.com/watch?v=LIrsjzz9TAQ',
          'https://www.youtube.com/watch?v=73DU7qK-_xs')

cast <- c('AABRIA', 'AIMEE', 'ANJALI', 'ASHLEY', 'LIAM', 'MATT', 'ROBBIE')

# get list of episodes
episodes <- str_c('ExU1E', format(1:length(URLs),
                                   width = 2,
                                   justify = 'right') %>% 
                    str_replace(' ', '0'))

# function to read in and format Youtube captions
cr_captions <- function(link, ep) {
  get_caption(link) %>% 
    mutate(text = str_split(text, '\n')) %>% 
    unnest(text) %>% 
    mutate(name = ifelse(str_detect(text, '^[:upper:]{3,}: '),
                         str_extract(text, '^[:upper:]{3,}'),
                         NA),
           text = str_remove(text, '^[:upper:]{3,}: '),
           start = start %>% floor() %>% seconds_to_period(),
           episode = ep) %>% 
    fill(name) %>% 
    mutate(mainCast = name %in% cast)
}

# function to strip data info and format as period
strp_date <- function(x) {
  strptime(x, '%Y-%m-%d %H:%M:%S') %>%
    str_sub( 12, -1) %>% 
    hms()
}

gs4_deauth()

runTimes <- read_sheet('https://docs.google.com/spreadsheets/d/1TQB5t7ZfbBamQ312znZgFbyiTOIflIgp52iE7Ah9BQY/edit#gid=1820863997',
                       sheet = 1,
                       col_types = 'ctttttltttt') [-c(1:2),] %>% 
  select(Episode, `1st start`, `1st end`, `2nd start`, `2nd end`) %>% 
  mutate(across(`1st start`:`2nd end`,
                .fns = strp_date))

datExU1 <- map2_dfr(URLs, episodes, cr_captions) %>% 
  left_join(runTimes,
            by = c('episode' = 'Episode')) %>% 
  mutate(gamePlay = (start >= `1st start` & start <= `1st end`) | (start >= `2nd start` & start <= `2nd end`)) %>% 
  select(-vid, -`1st start`, -`1st end`, -`2nd start`, -`2nd end`) %>% 
  filter(!str_detect(text,
                     '\\(.+\\)'))

saveRDS(datExU1,
        here('data', 'tidyDataExU1.rds'))
