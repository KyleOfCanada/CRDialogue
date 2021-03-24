library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

datC1 <- readRDS(here('data', 'tidyDataC1.rds'))
datC2 <- readRDS(here('data', 'tidyDataC2.rds'))
dat <- bind_rows(datC1, datC2)

#### campaign 1 ####

castSentences1 <- dat %>% 
  filter(mainCast,
         campaign == '1',
         !oneShot,
         gamePlay) %>% 
  select(name, text) %>% 
  unnest_tokens(sentence, 
                text,
                token = 'sentences') %>% 
  mutate(sentenceLength = str_count(sentence, '\\s') + 1) %>% 
  filter(sentenceLength > 1) %>% 
  mutate(sentence = str_remove_all(sentence, '[:punct:]')) %>% 
  count(name, sentence, sort = TRUE)

totalSentences1 <- castSentences1 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castSentences1 <- castSentences1 %>% 
  left_join(totalSentences1)

castSentences1 <- castSentences1 %>%
  bind_tf_idf(sentence, name, n)

castSentences1 %>% 
  arrange(desc(tf_idf))


colourScheme1 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                        bgColour = c('purple', 'darkblue', 'darkgreen', 'grey40', 'black', 'purple4', 'grey60', 'royalblue'),
                        textColour = c('green', 'white', 'red', 'blue', 'blue', 'pink', 'darkred', 'yellow'))

for(i in 1:8) {
  tmpDat <- castSentences1 %>% 
    filter(name == colourScheme1$name[i])

  png(here('plots', 'sentenceClouds', 'C1', paste0('C1', colourScheme1$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourScheme1$bgColour[i])

  wordcloud(paste0('"', str_to_title(tmpDat$sentence), '"'),
            tmpDat$tf_idf,
            scale = c(4, .5),
            max.words = 500,
            random.order = FALSE,
            colors = colourScheme1$textColour[i])
  dev.off()
}


#### campaign 2 ####

castSentences2 <- dat %>% 
  filter(mainCast,
         campaign == '2',
         !oneShot,
         gamePlay) %>% 
  select(name, text) %>% 
  unnest_tokens(sentence, 
                text,
                token = 'sentences') %>% 
  mutate(sentenceLength = str_count(sentence, '\\s') + 1) %>% 
  filter(sentenceLength > 1) %>% 
  mutate(sentence = str_remove_all(sentence, '[:punct:]')) %>% 
  count(name, sentence, sort = TRUE)

totalSentences2 <- castSentences2 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castSentences2 <- castSentences2 %>% 
  left_join(totalSentences2)

castSentences2 <- castSentences2 %>%
  bind_tf_idf(sentence, name, n)

castSentences2 %>% 
  arrange(desc(tf_idf))

colourScheme2 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                        bgColour = c('purple', 'blue', 'royalblue', '#03fce3', 'darkred', 'grey', 'darkgreen', 'grey'),
                        textColour = c('green', 'pink', 'white', '#fa8cdb', 'darkorange', 'darkgreen', 'lightblue', 'black'))

for(i in 1:8) {
  tmpDat <- castSentences2 %>% 
    filter(name == colourScheme2$name[i])
  
  png(here('plots', 'sentenceClouds', 'C2', paste0('C2', colourScheme2$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourScheme2$bgColour[i])
  
  wordcloud(paste0('"', str_to_title(tmpDat$sentence), '"'),
            tmpDat$tf_idf,
            scale = c(4, .5),
            max.words = 500,
            random.order = FALSE,
            colors = colourScheme2$textColour[i])
  dev.off()
}
