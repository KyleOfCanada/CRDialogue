library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

datExU1 <- readRDS(here('data', 'tidyDataExU1.rds'))

#### campaign 2 ####

castWordsExU1 <- datExU1 %>% 
  filter(mainCast,
         gamePlay) %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>%
  filter(!str_detect(word,
                     '\\d')) %>% 
  mutate(word = str_remove_all(word, '\'s')) %>% 
  count(name, word, sort = TRUE)

totalWordsExU1 <- castWordsExU1 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castWordsExU1 <- castWordsExU1 %>% 
  left_join(totalWordsExU1)

castWordsExU1 <- castWordsExU1 %>%
  bind_tf_idf(word, name, n)

castWordsExU1 %>% 
  arrange(desc(tf_idf))

colourSchemeExU1 <- tibble(name = c('AABRIA', 'AIMEE', 'ASHLEY', 'LIAM', 'MATT', 'ROBBIE'),
                        bgColour = c('#6c12a3', '#610a69', '#2d422c', '#91886c', '#757575', '#06155c'),
                        textColour = c('#1f9e0b', '#e8b2ed', '#d14913', '#4bcf1d', '#eb8715', '#46dde8'))

for(i in 1:8) {
  tmpDat <- castWordsExU1 %>% 
    filter(name == colourSchemeExU1$name[i])
  
  png(here('plots', 'wordClouds', 'ExU1', str_c('ExU1', colourSchemeExU1$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourSchemeExU1$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$word),
            tmpDat$tf_idf,
            scale = c(8, 1),
            max.words = 500,
            random.order = FALSE,
            colors = colourSchemeExU1$textColour[i])
  dev.off()
}
