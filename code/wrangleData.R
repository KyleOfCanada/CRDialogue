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
    tmplines
  }) %>% 
  as_tibble() %>% 
  mutate(mainCast = ifelse(name %in% castList,
                           TRUE,
                           FALSE))

# save tidy data
saveRDS(dat,
        here('data', 'tidyData.rds'))
