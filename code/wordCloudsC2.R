library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

dat <- readRDS(here('data', 'tidyData.rds'))

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
                        bgColour = c('#1f9e0b', 'blue', 'royalblue', '#03fce3', 'darkred', 'grey', 'darkgreen', 'grey'),
                        textColour = c('#6c12a3', 'pink', 'white', '#fa8cdb', 'darkorange', 'darkgreen', 'lightblue', 'black'))

for(i in 1:8) {
  tmpDat <- castWords2 %>% 
    filter(name == colourScheme2$name[i])
  
  png(here('plots', 'wordClouds', 'C2', paste0('C2', colourScheme2$name[i], '.png')),
      width = 720,
      height = 720,
      bg = colourScheme2$bgColour[i])
  
  wordcloud(str_to_title(tmpDat$word),
            tmpDat$tf_idf,
            scale = c(8, 1),
            max.words = 500,
            random.order = FALSE,
            colors = colourScheme2$textColour[i])
  dev.off()
}

# stats for C2

# total words
totalWords <- dat %>% 
  filter(campaign == '2',
         !oneShot) %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>% 
  nrow()

# words per cast member
wordsPerCast <- dat %>% 
  filter(campaign == '2',
         !oneShot,
         name %in% c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY')) %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>% 
  group_by(name) %>% 
  summarise(N = n()) %>% 
  arrange(desc(N))

# Ashley
ashleyOk <- castWords2 %>% 
  filter(word == 'okay',
         name == 'ASHLEY') %>% 
  select(name, word, n)

ashleyRage <- castWords2 %>% 
  filter(word =='rage',
         name == 'ASHLEY') %>% 
  select(name, word, n)

# Laura
lauraMama <- castWords2 %>% 
  filter(word %in% c('mama'),
         name == 'LAURA') %>% 
  select(name, word, n)

# Liam
liamCast <- castWords2 %>% 
  filter(word %in% c('cast', 'casts', 'casting'),
         name == 'LIAM') %>% 
  group_by(name, word) %>% 
  mutate(word = 'cast') %>% 
  summarise(n = sum(n))

# Marisha
marishaDope <- castWords2 %>% 
  filter(word == 'dope',
         name == 'MARISHA') %>% 
  select(name, word, n)

marishaStunning <- castWords2 %>% 
  filter(word == 'stunning',
         name == 'MARISHA') %>% 
  select(name, word, n)

# Matt
mattBegins <- castWords2 %>% 
  filter(word == 'begins',
         name == 'MATT') %>% 
  select(name, word, n)

mattRighty <- castWords2 %>% 
  filter(word == 'righty',
         name == 'MATT') %>% 
  select(name, word, n)

# Sam
samTraps <- castWords2 %>% 
  filter(word == 'traps',
         name == 'SAM') %>% 
  select(name, word, n)

# Taliesin
taliesinSuppose <- castWords2 %>% 
  filter(word == 'suppose',
         name == 'TALIESIN') %>% 
  select(name, word, n)

taliesinUndead <- castWords2 %>% 
  filter(word == 'undead',
         name == 'TALIESIN') %>% 
  select(name, word, n)

# Travis
travisBlast <- castWords2 %>% 
  filter(word %in% c('blast', 'blasts'),
         name == 'TRAVIS') %>% 
  group_by(name, word) %>% 
  mutate(word = 'blast') %>% 
  summarise(n = sum(n))

travisFalchion <- castWords2 %>% 
  filter(word == 'falchion',
         name == 'TRAVIS') %>% 
  select(name, word, n)

wordcloudStatsC2 <- bind_rows(ashleyOk, ashleyRage, lauraMama, liamCast, marishaDope, marishaStunning, mattBegins, mattRighty, samTraps, taliesinSuppose, taliesinUndead, travisBlast, travisFalchion)

save(totalWords, wordsPerCast, wordcloudStatsC2,
     file = here('data', 'cloudStatsC2.RData'))

#### Guests ####

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
            scale = c(8, 1),
            max.words = 500,
            random.order = FALSE,
            colors = colourSchemeG2$textColour[i])
  dev.off()
}

#### overall clouds ####

campWords <- dat %>% 
  filter(!oneShot,
         gamePlay) %>% 
  select(campaign, text) %>% 
  unnest_tokens(word, text) %>%
  filter(!str_detect(word,
                     '\\d')) %>% 
  mutate(word = str_remove_all(word, '\'s')) %>% 
  count(campaign, word, sort = TRUE)

totalWordsOverall <- campWords %>% 
  group_by(campaign) %>% 
  summarise(total = sum(n))

campWords <- campWords %>% 
  left_join(totalWordsOverall)

campWords <- campWords %>%
  bind_tf_idf(word, campaign, n)

campWords %>% 
  arrange(desc(tf_idf))