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
         campaign == '1') %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>%
  filter(!str_detect(word,
                    '\\d')) %>% 
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

# wordcloud(castWords1$word,
#           castWords1$tf_idf)

# test1 <- castWords1 %>% 
#   filter(name == "ASHLEY")
# 
# par(bg = 'royalblue')
# wordcloud(str_to_title(test1$word),
#           test1$tf_idf,
#           max.words = 100,
#           random.order = FALSE,
#           colors = 'yellow')

colourScheme1 <- tibble(name = c('MATT', 'LAURA', 'MARISHA', 'TALIESIN', 'LIAM', 'SAM', 'TRAVIS', 'ASHLEY'),
                          bgColour = c('purple', 'darkblue', 'darkgreen', 'grey40', 'black', 'purple4', 'grey60', 'royalblue'),
                          textColour = c('green', 'white', 'red', 'blue', 'darkblue', 'pink', 'darkred', 'yellow'))

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
         campaign == '2') %>% 
  select(name, text) %>% 
  unnest_tokens(word, text) %>%
  filter(!str_detect(word,
                     '\\d')) %>% 
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
                        bgColour = c('purple', 'blue', 'royalblue', 'green', 'darkred', 'grey', 'darkgreen', 'grey'),
                        textColour = c('green', 'pink', 'white', 'black', 'darkorange', 'darkgreen', 'lightblue', 'black'))

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
