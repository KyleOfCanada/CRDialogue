library(jsonlite)
library(tidyverse)
library(here)

# create list of json files
fileList <- list.files(here('data', 'jsonTranscripts'),
           full.names = TRUE,
           pattern = '.json')

# create list of main cast members
castList <- c('MATT', 'TRAVIS', 'MARISHA', 'TALIESIN', 'SAM', 'LIAM', 'LAURA', 'ASHLEY')

# read in json data and single tibble
dat <- fileList %>% 
  map_dfr(function(x) {
    tmpMetadata <- read_json(x,
                             simplifyVector = TRUE)$metadata
    tmplines <- read_json(x,
              simplifyVector = TRUE)$lines
    tmplines$campaign <- tmpMetadata$campaign
    tmplines$episode <- tmpMetadata$episode
    tmplines %>% 
      mutate(oneShot = str_detect(episode,
                                  '\\.'))
  }) %>% 
  as_tibble() %>% 
  separate(name,
           into = paste0('name', 1:8), # as of C2E120 max of 6 simultaneously, used 8
           sep = ', ') %>% 
  pivot_longer(cols = name1:name8,
               names_to = 'x',
               values_to = 'name') %>% 
  filter(!is.na(name)) %>% 
  select(-x) %>% 
  mutate(name = ifelse((name == 'ASHLEY' & campaign == '2' & episode %in% 26:29)
                       | (name == 'ASHLEY' & campaign == '1' & episode == '43.01')
                       | (name == 'ASHLEY' & campaign == '1' & episode == '65.01')
                       | (name == 'ASHLEY' & campaign == '1' & episode == '115.03'),
                       'ASHLY',
                       name),
         mainCast = name %in% castList)

# save tidy data
saveRDS(dat,
        here('data', 'tidyData.rds'))
