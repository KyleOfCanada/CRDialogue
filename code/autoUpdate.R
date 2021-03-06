library(tidyverse)
library(here)
library(rvest)
library(lubridate)

# get latest episode numbers
episodeCount <- readRDS(here('data', 'episodeCount.rds'))

# get the next episode
episode <- episodeCount[nrow(episodeCount), 2]

moreEpisodes <- TRUE
# progress through downloading episodes until file not found
while(moreEpisodes) {
  
  oneshot <- episode + .01
  moreOneshots <- TRUE
  while(moreOneshots){
    oneshotURL <- str_c('https://kryogenix.org/crsearch/html/cr2-', oneshot, '.html')
    downloadName <- str_c('cr2-', oneshot, '.html')
    oneshotDownloaded <- try(download.file(oneshotURL,
                                           destfile = here('data', 'html', downloadName)))
    if(class(oneshotDownloaded) == 'try-error') {
      moreOneshots <- FALSE
    } else {
      oneshot <- oneshot + .01
    }
  }
  
  episode <- floor(episode) + 1
  nextURL <- str_c('https://kryogenix.org/crsearch/html/cr2-', episode, '.html')
  downloadName <- str_c('cr2-', episode, '.html')
  fileDownloaded <- try(download.file(nextURL,
                                      destfile = here('data', 'html', downloadName)))
  if(class(fileDownloaded) == 'try-error') {
    moreEpisodes <- FALSE
  } else {
    episode <- episode + 1
  }
}

if(episode == (episodeCount[nrow(episodeCount), 2] + 1)) {
  warning('No new episodes available',
          call. = FALSE)
} else {
  # function to read html files and save as rds
  
  htmlHarvest <- function(htmlFile) {
    
    html <- read_html(htmlFile)
    
    title <- html %>% 
      html_elements('main') %>% 
      html_element('h3') %>% 
      html_text()
    
    if(is.na(title)) {
      warning('Transcript not available')
    } else {
      datLines <- html %>% 
        html_elements('#lines') %>% 
        html_children() 
      
      times <- datLines %>% 
        html_attr('id') %>% 
        as_tibble() %>%  
        rename(ts = value) %>% 
        filter(!is.na(ts))
      
      dat <- datLines %>% 
        html_text() %>% 
        as_tibble() %>% 
        rename(text = value) %>% 
        mutate(name = ifelse(str_detect(text, '^# '),
                             str_remove(text, '^# '),
                             NA)) %>% 
        fill(name) %>% 
        filter(!str_detect(text, '^# ')) %>%
        bind_cols(times) %>% 
        mutate(text = str_remove(text, ' →'),
               ts = hms(ts),
               campaign = str_extract(title, '(?<=^Campaign )\\d+'),
               episode = str_extract(title, '(?<=Episode )\\d+\\.?\\d*$'))
      
      saveFileName <- str_c('cr', str_extract(title, '(?<=^Campaign )\\d+'), '-', str_extract(title, '(?<=Episode )\\d+\\.?\\d*$'), '.rds')
      
      saveRDS(dat, 
              here('data', 'rdsTranscripts', saveFileName))
      
      cat(str_c('Saved ', saveFileName, '\n'))
    }
  }
  
  # read in html files and save as rds
  list.files(here('data', 'html'),
             pattern = '\\.html',
             full.names = TRUE) %>% 
    map(htmlHarvest)
  
  
  # delete processed html files
  list.files(here('data', 'html'),
                          pattern = '\\.html',
                          full.names = TRUE) %>% 
    map(file.remove)
  
  # run R scripts with new episodes
  source(here('code', 'wrangleDataC2.R')) 
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
