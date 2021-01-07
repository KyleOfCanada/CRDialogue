library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

dat <- readRDS(here('data', 'tidyData.rds'))

#### campaign 1 ####

castBigrams1 <- dat %>% 
  filter(mainCast,
         campaign == '1',
         !oneShot,
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
         digits = !str_detect(word1,'[:alpha:]') | !str_detect(word2,'[:alpha:]')) %>% 
  filter(!stopword,
         !digits) %>% 
  select(name, bigram) %>% 
  count(name, bigram, sort = TRUE)

totalBigrams1 <- castBigrams1 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castBigrams1 <- castBigrams1 %>% 
  left_join(totalBigrams1)

castBigrams1 <- castBigrams1 %>%
  bind_tf_idf(bigram, name, n)

castBigrams1 %>% 
  arrange(desc(tf_idf))

colourScheme1 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                        bgColour = c('purple', 'darkblue', 'darkgreen', 'grey40', 'black', 'purple4', 'grey60', 'royalblue'),
                        textColour = c('green', 'white', 'red', 'blue', 'blue', 'pink', 'darkred', 'yellow'))

for(i in 1:8) {
  tmpDat <- castBigrams1 %>% 
    filter(name == colourScheme1$name[i])
  
  png(here('plots', 'bigramClouds', 'C1', paste0('C1', colourScheme1$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourScheme1$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$bigram),
            tmpDat$tf_idf,
            scale = c(6, .8),
            max.words = 500,
            random.order = FALSE,
            colors = colourScheme1$textColour[i])
  dev.off()
}

#### campaign 2 ####

castBigrams2 <- dat %>% 
  filter(mainCast,
         campaign == '2',
         !oneShot,
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
         digits = !str_detect(word1,'[:alpha:]') | !str_detect(word2,'[:alpha:]')) %>% 
  filter(!stopword,
         !digits) %>% 
  select(name, bigram) %>% 
  count(name, bigram, sort = TRUE)

totalBigrams2 <- castBigrams2 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castBigrams2 <- castBigrams2 %>% 
  left_join(totalBigrams2)

castBigrams2 <- castBigrams2 %>%
  bind_tf_idf(bigram, name, n)

castBigrams2 %>% 
  arrange(desc(tf_idf))

colourScheme2 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                        bgColour = c('purple', 'blue', 'royalblue', '#03fce3', 'darkred', 'grey', 'darkgreen', 'grey'),
                        textColour = c('green', 'pink', 'white', '#fa8cdb', 'darkorange', 'darkgreen', 'lightblue', 'black'))

for(i in 1:8) {
  tmpDat <- castBigrams2 %>% 
    filter(name == colourScheme2$name[i])
  
  png(here('plots', 'bigramClouds', 'C2', paste0('C2', colourScheme2$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourScheme2$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$bigram),
            tmpDat$tf_idf,
            scale = c(6, .8),
            max.words = 500,
            random.order = FALSE,
            colors = colourScheme2$textColour[i])
  dev.off()
}

