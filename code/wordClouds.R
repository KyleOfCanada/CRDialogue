library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

dat <- readRDS(here('data', 'tidyData.rds'))

#### campaign 1 ####

castWords1 <- dat %>% 
  filter(mainCast,
         campaign == '1',
         !oneShot,
         gamePlay) %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>%
  filter(!str_detect(word,
                    '\\d')) %>% 
  mutate(word = str_remove_all(word, '\'s')) %>% 
  count(name, word, sort = TRUE)
  
totalWords1 <- castWords1 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castWords1 <- castWords1 %>% 
  left_join(totalWords1)

castWords1 <- castWords1 %>%
  bind_tf_idf(word, name, n)

castWords1 %>% 
  arrange(desc(tf_idf))

colourScheme1 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                          bgColour = c('purple', 'darkblue', 'darkgreen', 'grey40', 'black', 'purple4', 'grey60', 'royalblue'),
                          textColour = c('green', 'white', 'red', 'blue', 'blue', 'pink', 'darkred', 'yellow'))

for(i in 1:8) {
  tmpDat <- castWords1 %>% 
    filter(name == colourScheme1$name[i])
  
  png(here('plots', 'wordClouds', 'C1', paste0('C1', colourScheme1$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourScheme1$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$word),
            tmpDat$tf_idf,
            scale = c(8, .5),
            max.words = 500,
            random.order = FALSE,
            colors = colourScheme1$textColour[i])
  dev.off()
}


#### campaign 2 ####

castWords2 <- dat %>% 
  filter(mainCast,
         campaign == '2',
         !oneShot,
         gamePlay) %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>%
  filter(!str_detect(word,
                     '\\d')) %>% 
  mutate(word = str_remove_all(word, '\'s')) %>% 
  count(name, word, sort = TRUE)

totalWords2 <- castWords2 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

castWords2 <- castWords2 %>% 
  left_join(totalWords2)

castWords2 <- castWords2 %>%
  bind_tf_idf(word, name, n)

castWords2 %>% 
  arrange(desc(tf_idf))

colourScheme2 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                        bgColour = c('purple', 'blue', 'royalblue', '#03fce3', 'darkred', 'grey', 'darkgreen', 'grey'),
                        textColour = c('green', 'pink', 'white', '#fa8cdb', 'darkorange', 'darkgreen', 'lightblue', 'black'))

for(i in 1:8) {
  tmpDat <- castWords2 %>% 
    filter(name == colourScheme2$name[i])
  
  png(here('plots', 'wordClouds', 'C2', paste0('C2', colourScheme2$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourScheme2$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$word),
            tmpDat$tf_idf,
            scale = c(8, .5),
            max.words = 500,
            random.order = FALSE,
            colors = colourScheme2$textColour[i])
  dev.off()
}

#### Guests ####

# campaign 1

guestsC1 <- c('MARY', 'NOELLE', 'WIL', 'DARIN', 'CHRIS', 'FELICIA', 'JON', 'KIT', 'PATRICK', 'WILL', 'JASON', 'JOE')

guestWords1 <- dat %>% 
  filter(campaign == 1,
         !oneShot,
         gamePlay) %>% 
  mutate(guest = name %in% guestsC1) %>% 
  filter(mainCast | guest) %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>%
  filter(!str_detect(word,
                     '\\d')) %>% 
  mutate(word = str_remove_all(word, '\'s')) %>% 
  count(name, word, sort = TRUE)

totalWordsG1 <- guestWords1 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

guestWords1 <- guestWords1 %>% 
  left_join(totalWordsG1)

guestWords1 <- guestWords1 %>%
  bind_tf_idf(word, name, n) %>% 
  filter(name %in% guestsC1)

guestWords1 %>% 
  arrange(desc(tf_idf))

colourSchemeG1 <- tibble(name = guestsC1,
                        bgColour = 'white',
                        textColour = 'black')

for(i in 1:nrow(colourSchemeG1)) {
  tmpDat <- guestWords1 %>% 
    filter(name == colourSchemeG1$name[i])
  
  png(here('plots', 'wordClouds', 'C1', 'guests', paste0('C1', colourSchemeG1$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourSchemeG1$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$word),
            tmpDat$tf_idf,
            scale = c(8, .5),
            max.words = 500,
            random.order = FALSE,
            colors = colourSchemeG1$textColour[i])
  dev.off()
}


# campaign 2

guestsC2 <- c('DEBORAH', 'CHRIS', 'KHARY', 'MICA', 'SUMALEE', 'MARK', 'ASHLY')


guestWords2 <- dat %>% 
  filter(campaign == 2,
         !oneShot,
         gamePlay) %>% 
  mutate(guest = name %in% guestsC2) %>% 
  filter(mainCast | guest) %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>%
  filter(!str_detect(word,
                     '\\d')) %>% 
  mutate(word = str_remove_all(word, '\'s')) %>% 
  count(name, word, sort = TRUE)

totalWordsG2 <- guestWords2 %>% 
  group_by(name) %>% 
  summarise(total = sum(n))

guestWords2 <- guestWords2 %>% 
  left_join(totalWordsG2)

guestWords2 <- guestWords2 %>%
  bind_tf_idf(word, name, n) %>% 
  filter(name %in% guestsC2)

guestWords2 %>% 
  arrange(desc(tf_idf))

colourSchemeG2 <- tibble(name = guestsC2,
                         bgColour = 'white',
                         textColour = 'black')

for(i in 1:nrow(colourSchemeG2)) {
  tmpDat <- guestWords2 %>% 
    filter(name == colourSchemeG2$name[i])
  
  png(here('plots', 'wordClouds', 'C2', 'guests', paste0('C2', colourSchemeG2$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourSchemeG2$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$word),
            tmpDat$tf_idf,
            scale = c(8, .5),
            max.words = 500,
            random.order = FALSE,
            colors = colourSchemeG2$textColour[i])
  dev.off()
}
