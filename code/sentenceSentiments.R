library(tidyverse)
library(tidytext)
library(textdata)
library(sentimentr)
library(lubridate)
library(here)

#### load tidy data ####

dat <- readRDS(here('data', 'tidyData.rds'))

#### Campaign 1 ####

c1Dat <- dat %>% 
  filter(campaign == '1',
         gamePlay,
         !oneShot) %>% 
  mutate(splitSentences = get_sentences(text),
         sent = sentiment_by(splitSentences),
         timeMin = minute(ts) + 60 * hour(ts),
         lenghtSen = lengths(splitSentences)) %>% 
  group_by(episode, timeMin) %>% 
  summarise(meanSent = mean(sent$ave_sentiment * lenghtSen)) %>% 
  ungroup() %>% 
  mutate(indexN = row_number())

c1Dat %>% 
  ggplot(aes(x = indexN,
             y = meanSent,
             group = episode)) +
  geom_point(alpha = .2) +
  geom_smooth(se = FALSE,
              colour = 'red') +
  geom_hline(yintercept = 0,
             colour = 'white') +
  coord_cartesian(ylim = c(-1, 1)) +
  labs(title = "Campaign 1")

c1Dat %>% 
  group_by(episode) %>% 
  summarise(meanSent = mean(meanSent)) %>% 
  mutate(episode = as.numeric(episode)) %>% 
  ggplot(aes(x = episode,
             y = meanSent)) +
  geom_point(alpha = .2) +
  geom_smooth(se = FALSE,
              colour = 'red') +
  geom_hline(yintercept = 0,
             colour = 'white') +
  labs(title = "Campaign 1")

#### Campaign 2 ####

c2Dat <- dat %>% 
  filter(campaign == '2',
         gamePlay,
         !oneShot) %>% 
  mutate(splitSentences = get_sentences(text),
         sent = sentiment_by(splitSentences),
         timeMin = minute(ts) + 60 * hour(ts),
         lenghtSen = lengths(splitSentences)) %>% 
  group_by(episode, timeMin) %>% 
  summarise(meanSent = mean(sent$ave_sentiment * lenghtSen)) %>% 
  ungroup() %>% 
  mutate(indexN = row_number())

c2Dat %>% 
  ggplot(aes(x = indexN,
             y = meanSent,
             group = episode)) +
  geom_point(alpha = .2) +
  geom_smooth(se = FALSE,
              colour = 'red') +
  geom_hline(yintercept = 0,
             colour = 'white') +
  coord_cartesian(ylim = c(-1, 1)) +
  labs(title = "Campaign 2")

c2Dat %>% 
  group_by(episode) %>% 
  summarise(meanSent = mean(meanSent)) %>% 
  mutate(episode = as.numeric(episode)) %>% 
  ggplot(aes(x = episode,
             y = meanSent)) +
  geom_point(alpha = .2) +
  geom_smooth(se = FALSE,
              colour = 'red') +
  geom_hline(yintercept = 0,
             colour = 'white') +
  labs(title = "Campaign 2")
