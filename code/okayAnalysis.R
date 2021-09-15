library(tidyverse)
library(here)
library(tidytext)
library(googlesheets4)

#### load tidy data ####
datC1 <- readRDS(here('data', 'tidyDataC1.rds'))
datC2 <- readRDS(here('data', 'tidyDataC2.rds'))
dat <- bind_rows(datC1, datC2) %>% 
  filter(!oneShot,
         gamePlay)

#### get attendance data ####

gs4_deauth()

attC1 <- read_sheet('https://docs.google.com/spreadsheets/d/1Zx1N0cQcd1fJadUwar7f2hJ2p61qoX7lctsVaIEa5uM/edit#gid=744793917',
                    sheet = 3,
                    col_types = 'cDnnnnnnnnlnnnlcc')[-1,] %>% 
  mutate(campaign = '1',
         episode = str_sub(Episode, 4, 6) %>% as.numeric() %>% as.character()) %>% 
  select(campaign, episode, Laura:Ashley) 

attC2 <- read_sheet('https://docs.google.com/spreadsheets/d/1E1DfdXJVu9UpGNG29JMHT3ovk8Ol_UTzol40DMzz-rw/edit#gid=1820863997',
                    sheet = 3,
                    col_types = 'cDnnnnnnnlnnnlcc')[-1,] %>% 
  mutate(campaign = '2',
         episode = str_sub(Episode, 4, 6) %>% as.numeric() %>% as.character()) %>% 
  select(campaign, episode, Laura:Ashley) 

attDat <- bind_rows(attC1, attC2) %>% 
  mutate(across(Laura:Ashley,
                ~ .x == 1),
         across(Laura:Ashley,
          ~ if_else(is.na(.x),
                    FALSE,
                    .x)))

attSum <- attDat %>% 
  mutate(Matt = TRUE) %>% 
  summarise(across(Laura:Matt,
                   ~sum(.x, na.rm = TRUE))) %>% 
  pivot_longer(cols = Laura:Matt,
               names_to = 'name',
               values_to = 'attended')

#### detect and filter okay okay okay ####
okTrigrams <- dat %>% 
  filter(mainCast,
         !oneShot) %>% 
  unnest_tokens(trigram, 
                text,
                token = 'ngrams',
                n = 3) %>%
  select(campaign, episode, name, trigram) %>% 
  filter(trigram == 'okay okay okay') %>% 
  left_join(attDat)

castWords <- dat %>% 
  filter(mainCast, gamePlay, !oneShot) %>% 
  unnest_tokens(word,
                text,
                token = 'words') %>% 
  group_by(name) %>% 
  count(name = 'words') %>% 
  mutate(name = str_to_title(name))

okCast <- okTrigrams %>% 
  group_by(name) %>% 
  count(trigram,
        sort = TRUE) %>% 
  mutate(name = str_to_title(name)) %>% 
  select(name, n) %>% 
  left_join(attSum) %>% 
  left_join(castWords) %>% 
  mutate(perEpisode = n / attended,
         perWord = n*3 / words,
         OneInEvery = 1/perWord) %>% 
  arrange(desc(perWord))

okTrigrams %>% 
  group_by(campaign, episode) %>% 
  count(trigram,
        sort = TRUE) %>%
  ungroup() %>% 
  complete(episode = 1:141 %>% as.character(), # needs to change
           campaign = 1:2 %>% as.character(),
           trigram = 'okay okay okay',
           fill = list(n = 0)) %>% 
  filter(!(campaign == '1' & episode %>% as.numeric() > 115)) %>% 
  left_join(attDat) %>% 
  filter(!is.na(Ashley)) %>% 
  mutate(counter = episode %>% as.numeric() + if_else(campaign == '2', 115, 0)) %>% 
  ggplot(aes(x = counter,
             y = n,
             colour = campaign)) +
  # geom_rug(sides = 'b',
  #          aes(x = counter,
  #          y = if_else(Ashley, 1, 0))) +
  geom_tile(aes(fill = Ashley, #ifelse(Ashley, 'green', '#RRGGBBAA'),
                y = 6,
                linetype = NA),
            width = 1,
            height = 12,
            show.legend = FALSE) +
  geom_point() +
  geom_smooth() +
  scale_fill_manual(values = c(NA, 'green')) +
  coord_cartesian(ylim = c(0, 12)) +
  theme_classic() +
  theme(panel.grid = element_blank())

okDat <- okTrigrams %>% 
  group_by(campaign, episode) %>% 
  count(trigram,
        sort = TRUE) %>%
  ungroup() %>% 
  complete(episode = 1:141 %>% as.character(),
           campaign = 1:2 %>% as.character(),
           trigram = 'okay okay okay',
           fill = list(n = 0)) %>% 
  filter(!(campaign == '1' & episode %>% as.numeric() > 115)) %>% 
  left_join(attDat) %>% 
  filter(!is.na(Ashley))

t.test(n ~ Ashley,
       data = okDat)
okDat %>% 
  group_by(Ashley) %>% 
  summarise(n = mean_cl_boot(n))

t.test(n ~ Laura,
       data = okDat)


library(MuMIn); options(na.action = 'na.fail')
library(modelsummary)

ms <- lm(n ~ Laura + Ashley + Liam + Marisha + Taliesin + Travis + Sam,
    data = okDat)
modelplot(ms,
          coef_omit = 'Intercept',
          colour = 'red') +
  geom_vline(xintercept = 0)
okDredge <- dredge(ms)
okModels <- get.models(okDredge,
                      delta < 2)
modelplot(okModels,
          coef_omit = 'Intercept')


okTrigrams %>% 
  group_by(campaign, episode) %>% 
  count(trigram) %>% 
  ungroup() %>% 
  complete(episode = 1:141 %>% as.character(),
           campaign = 1:2 %>% as.character(),
           trigram = 'okay okay okay',
           fill = list(n = 0)) %>% 
  filter(!(campaign == '1' & episode %>% as.numeric() > 115)) %>% 
  group_by(n) %>% 
  count(n, sort = TRUE)
