library(tidyverse)
library(here)

# get latest episode numbers
episodeCount <- readRDS(here('data', 'episodeCount.rds'))

# get the next episode
nextEpisode <- (episodeCount[nrow(episodeCount), 2] + 1) %>% 
  as.character()

moreEpisodes <- TRUE
# progress through downloading episodes until file not found
while(moreEpisodes) {
  nextURL <- str_c('https://kryogenix.org/crsearch/html/cr2-', nextEpisode, '.html')
  downloadName <- str_c('cr2-', nextEpisode, '.html')
  fileDownloaded <- try(download.file(nextURL,
                                      destfile = here('data', 'html', downloadName)))
  if(class(fileDownloaded) == 'try-error') {
    moreEpisodes <- FALSE
  } else {
    nextEpisode <- nextEpisode + 1
  }
}

if(nextEpisode == (episodeCount[nrow(episodeCount), 2] + 1)) {
  warning('No new episodes available',
          call. = FALSE)
} else {
  # run python script to convert html to json files
  reticulate::py_run_file(here('data', 'tojson.py'))
  
  # delete processed html files
  list.files(here('data', 'html'),
                          pattern = '.html',
                          full.names = TRUE) %>% 
    map(file.remove)
  
  # run R scripts with new episodes
  source(here('code', 'wrangleData.R')) 
  1 # to select google account to read in critrolestats tables
  runC2Guests <- FALSE # set to TRUE to run code for guests in C2
  source(here('code', 'wordCloudsC2.R'))
  source(here('code', 'sentiments.R'))
  source(here('code', 'bigramCloudsC2.R'))
  
  # render updated markdown docs
  rmarkdown::render(here('code', 'RmdFiles', 'wordCloudsC2.Rmd'),
                    output_dir = here('docs'))
  rmarkdown::render(here('code', 'RmdFiles', 'sentiments.Rmd'),
                    output_dir = here('docs'))
  rmarkdown::render(here('code', 'RmdFiles', 'bigramsC2.Rmd'),
                    output_dir = here('docs'))
  rmarkdown::render(here('code', 'RmdFiles', 'README.Rmd'),
                    output_dir = here())
}

