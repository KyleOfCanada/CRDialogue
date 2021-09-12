library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

datExU1 <- readRDS(here('data', 'tidyDataExU1.rds'))

#### campaign 2 ####

castBigramsExU1 <- datExU1 %>% 
  filter(mainCast,
         gamePlay) %>% 
  select(name, text) %>% 
  unnest_tokens(bigram, 
                text,
                token = 'ngrams',
                n = 2) %>%
  separate(bigram,
           into = c('word1', 'word2'),
           sep = ' ',
           remove = FALSE) %>% 
  mutate(stopword = (word1 %in% stop_words$word) | (word2 %in% stop_words$word),
         digits = str_detect(word1,'[:digit:]') | str_detect(word2,'[:digit:]')) %>% 
  filter(!stopword,
         !digits) %>% 
  select(name, bigram) %>% 
  count(name, bigram, sort = TRUE)

totalBigramsExU1 <- castBigramsExU1 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castBigramsExU1 <- castBigramsExU1 %>% 
  left_join(totalBigramsExU1)

castBigramsExU1 <- castBigramsExU1 %>%
  bind_tf_idf(bigram, name, n)

castBigramsExU1 %>% 
  arrange(desc(tf_idf))

colourSchemeExU1 <- tibble(name = c('AABRIA', 'AIMEE', 'ASHLEY', 'LIAM', 'MATT', 'ROBBIE'),
                           bgColour = c('#6c12a3', '#610a69', '#2d422c', '#91886c', '#757575', '#06155c'),
                           textColour = c('#1f9e0b', '#e8b2ed', '#d14913', '#4bcf1d', '#eb8715', '#46dde8'))

for(i in 1:6) {
  tmpDat <- castBigramsExU1 %>% 
    filter(name == colourSchemeExU1$name[i])
  
  png(here('plots', 'bigramClouds', 'ExU1', paste0('ExU1', colourSchemeExU1$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourSchemeExU1$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$bigram),
            tmpDat$tf_idf,
            scale = c(6, .8),
            max.words = 500,
            random.order = FALSE,
            colors = colourSchemeExU1$textColour[i])
  dev.off()
}

saveRDS(castBigramsExU1,
        file = here('data', 'bigramsExU1.rds'))
