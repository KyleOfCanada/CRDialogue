library(tidyverse)
library(tidytext)
library(textdata)
library(here)
library(knitr)

#### load tidy data ####

dat <- readRDS(here('data', 'tidyData.rds'))

#### tokenize text, get sentiments, calc sentiment frequencies ####

datNRC <- dat %>% 
  separate(name,
           into = paste0('name', 1:8), # as of C2E120 max of 6 simultaneously, used 8
           sep = ', ') %>% 
  pivot_longer(cols = name1:name8,
               names_to = 'x',
               values_to = 'name') %>% 
  filter(!is.na(name)) %>% 
  select(-x) %>% 
  filter(mainCast) %>% 
  select(name, campaign, episode, text) %>% 
  unnest_tokens(word, text) %>% 
  inner_join(get_sentiments('nrc'))


totalSentiments <- datNRC %>% 
  filter(name != 'MATT') %>% 
  group_by(name) %>% 
  count(sentiment) %>% 
  mutate(castTot = sum(n),
         castSentimentFreq = n / castTot) %>% 
  group_by(sentiment) %>% 
  mutate(globalSentimentN = sum(n)) %>% 
  ungroup() %>% 
  mutate(globalTot = sum(n),
         globalFreq = globalSentimentN / globalTot,
         castSentUniquness = castSentimentFreq / globalFreq,
         sentiment = fct_infreq(sentiment))

totalSentiments %>% 
  ggplot(aes(x = sentiment,
             y = castSentUniquness)) +
  geom_hline(yintercept = 1,
             linetype = 'dashed') +
  geom_col(fill = 'grey50') +
  facet_wrap(~name) +
  theme(axis.text.x = element_text(angle = 90))

#### positive vs negative sentiments ####

datBing <- dat %>% 
  filter(mainCast) %>% 
  select(name, campaign, episode, text) %>% 
  unnest_tokens(word, text) %>% 
  inner_join(get_sentiments('bing'))

posNeg <- datBing %>% 
  filter(name != 'MATT',
         sentiment %in% c('positive', 'negative')) %>% 
  group_by(name, sentiment) %>% 
  count(sentiment) %>% 
  pivot_wider(name,
              names_from = sentiment,
              values_from = n) %>% 
  mutate(ratio = positive / negative) %>% 
  arrange(desc(ratio))

datAfinn <- dat %>% 
  filter(mainCast) %>% 
  select(name, campaign, episode, text) %>% 
  unnest_tokens(word, text) %>% 
  inner_join(get_sentiments('afinn'))

posNeg2 <- datAfinn %>% 
  filter(name != 'MATT') %>% 
  group_by(name) %>% 
  summarise(meanValue = mean(value))

plotPosNeg <- posNeg %>% 
  mutate(name = factor(name,
                       levels = c('TRAVIS', 'LIAM', 'MARISHA', 'TALIESIN', 'ASHLEY', 'SAM', 'LAURA'))) %>% 
  ggplot(aes(x = name,
             y = ratio)) +
  geom_col(fill = 'darkgreen') +
  geom_text(aes(label = str_to_title(name),
                y = 0),
            hjust = 0,
            nudge_y = .05,
            fontface = 'bold',
            size = rel(5),
            colour = 'white') +
  coord_flip() +
  theme_classic() +
  scale_y_continuous(expand = expansion(mult = c(0, .1))) +
  labs(x = NULL,
       y = 'Positive to Negative Word Ratio',
       title = 'Positive versus Negative Sentiment') +
  theme(axis.text.y = element_blank(),
        axis.text.x = element_text(colour = 'white'),
        axis.title = element_text(colour = 'white'),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_line(colour = 'white'),
        axis.line = element_line(colour = 'white'),
        plot.title = element_text(colour = 'white'),
        plot.background = element_rect(fill = '#23272A'),
        panel.background = element_rect(fill = '#23272A'))

ggsave(here('plots', 'positiveNegativePlot.png'),
       plot = plotPosNeg,
       width = 8.5,
       height = 5)

posNeg %>% 
  mutate(name = str_to_title(name)) %>% 
  select(Name = name,
         Negative = negative,
         Positive = positive,
         Ratio = ratio) %>% 
  kable(format = 'pipe',
        digits = 2)

#### joy vs  sadness ####

joySad <- datNRC %>% 
  filter(name != 'MATT',
         sentiment %in% c('joy', 'sadness')) %>% 
  group_by(name, sentiment) %>% 
  count(sentiment) %>% 
  pivot_wider(name,
              names_from = sentiment,
              values_from = n) %>% 
  mutate(ratio = joy / sadness) %>% 
  arrange(desc(ratio))

plotJoySad <- joySad %>% 
  mutate(name = factor(name,
                       levels = c('TALIESIN', 'TRAVIS', 'LIAM', 'MARISHA', 'SAM', 'LAURA', 'ASHLEY'))) %>% 
  ggplot(aes(x = name,
             y = ratio)) +
  geom_col(fill = 'darkgreen') +
  geom_text(aes(label = str_to_title(name),
                y = 0),
            hjust = 0,
            nudge_y = .05,
            fontface = 'bold',
            size = rel(5),
            colour = 'white') +
  coord_flip() +
  theme_classic() +
  scale_y_continuous(expand = expansion(mult = c(0, .1))) +
  labs(x = NULL,
       y = 'Joy to Sadness Word Ratio',
       title = 'Joyful versus Sadness Sentiment') +
  theme(axis.text.y = element_blank(),
        axis.text.x = element_text(colour = 'white'),
        axis.title = element_text(colour = 'white'),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_line(colour = 'white'),
        axis.line = element_line(colour = 'white'),
        plot.title = element_text(colour = 'white'),
        plot.background = element_rect(fill = '#23272A'),
        panel.background = element_rect(fill = '#23272A'))

ggsave(here('plots', 'joySadPlot.png'),
       plot = plotJoySad,
       width = 8.5,
       height = 5)

joySad %>% 
  mutate(name = str_to_title(name)) %>% 
  select(Name = name,
         Joy = joy,
         Sadness = sadness,
         Ratio = ratio) %>% 
  kable(format = 'pipe',
        digits = 2)
