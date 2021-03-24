library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

datC1 <- readRDS(here('data', 'tidyDataC1.rds'))
datC2 <- readRDS(here('data', 'tidyDataC2.rds'))
dat <- bind_rows(datC1, datC2)

curses <- c('^ass', '\\sass', 'bastard', 'bitch', 'damn', 'dick', 'fuck', 'piss', 'shit')

#### campaign 1 ####

castCurses1 <- dat %>% 
  filter(mainCast,
         campaign == '1',
         !oneShot,
         gamePlay) %>% 
  select(name, text) %>% 
  unnest_tokens(sentence, 
                text,
                token = 'sentences') %>% 
  mutate(sentence = str_remove_all(sentence, '[:punct:]'),
         curse = str_detect(sentence, curses)) %>% 
  filter(curse) %>% 
  count(name, sentence, sort = TRUE)

totalCurses1 <- castCurses1 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castCurses1 <- castCurses1 %>% 
  left_join(totalCurses1)

castCurses1 <- castCurses1 %>%
  bind_tf_idf(sentence, name, n)

castCurses1 %>% 
  arrange(desc(tf_idf))


colourScheme1 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                        bgColour = c('purple', 'darkblue', 'darkgreen', 'grey40', 'black', 'purple4', 'grey60', 'royalblue'),
                        textColour = c('green', 'white', 'red', 'blue', 'blue', 'pink', 'darkred', 'yellow'))

for(i in 1:8) {
  tmpDat <- castCurses1 %>% 
    filter(name == colourScheme1$name[i])
  
  png(here('plots', 'curseClouds', 'C1', paste0('C1', colourScheme1$name[i], '.png')),
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

castCurses2 <- dat %>% 
  filter(mainCast,
         campaign == '2',
         !oneShot,
         gamePlay) %>% 
  select(name, text) %>% 
  unnest_tokens(sentence, 
                text,
                token = 'sentences') %>% 
  mutate(sentence = str_remove_all(sentence, '[:punct:]'),
         curse = str_detect(sentence, curses)) %>% 
  filter(curse) %>% 
  count(name, sentence, sort = TRUE)

totalCurses2 <- castCurses2 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castCurses2 <- castCurses2 %>% 
  left_join(totalCurses2)

castCurses2 <- castCurses2 %>%
  bind_tf_idf(sentence, name, n)

castCurses2 %>% 
  arrange(desc(tf_idf))

colourScheme2 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                        bgColour = c('purple', 'blue', 'royalblue', '#03fce3', 'darkred', 'grey', 'darkgreen', 'grey'),
                        textColour = c('green', 'pink', 'white', '#fa8cdb', 'darkorange', 'darkgreen', 'lightblue', 'black'))

for(i in 1:8) {
  tmpDat <- castCurses2 %>% 
    filter(name == colourScheme2$name[i])
  
  png(here('plots', 'curseClouds', 'C2', paste0('C2', colourScheme2$name[i], '.png')),
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
