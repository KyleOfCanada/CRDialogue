library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

datC3 <- readRDS(here("data", "tidyDataC3.rds"))

#### campaign 2 ####

castBigrams3 <- datC3 %>%
  filter(
    mainCast,
    campaign == "3",
    !oneShot,
    gamePlay
  ) %>%
  select(name, text) %>%
  unnest_tokens(bigram,
    text,
    token = "ngrams",
    n = 2
  ) %>%
  separate(bigram,
    into = c("word1", "word2"),
    sep = " ",
    remove = FALSE
  ) %>%
  mutate(
    stopword = (word1 %in% stop_words$word) | (word2 %in% stop_words$word),
    digits = !str_detect(word1, "[:alpha:]") | !str_detect(word2, "[:alpha:]")
  ) %>%
  filter(
    !stopword,
    !digits
  ) %>%
  select(name, bigram) %>%
  count(name, bigram, sort = TRUE)

totalBigrams3 <- castBigrams3 %>%
  group_by(name) %>%
  summarise(total = sum(n))

castBigrams3 <- castBigrams3 %>%
  left_join(totalBigrams3)

castBigrams3 <- castBigrams3 %>%
  bind_tf_idf(bigram, name, n)

castBigrams3 %>%
  arrange(desc(tf_idf))

colourScheme3 <- tibble(
  name = c("MATT", "LAURA", "MARISHA", "TALIESIN", "LIAM", "SAM", "TRAVIS", "ASHLEY"),
  bgColour = c("#1f9e0b", "#a888bd", "grey", "#507a5d", "#91886c", "#f5cf36", "#46157d", "#2d422c"),
  textColour = c("#6c12a3", "#e8be27", "black", "#3f0b61", "#4bcf1d", "#376482", "#a63b11", "#d14913")
)

for (i in 1:8) {
  tmpDat <- castBigrams3 %>%
    filter(name == colourScheme3$name[i])

  png(here("plots", "bigramClouds", "C3", paste0("C3", colourScheme3$name[i], ".png")),
    width = 720,
    height = 720,
    bg = colourScheme3$bgColour[i]
  )

  wordcloud(str_to_title(tmpDat$bigram),
    tmpDat$tf_idf,
    scale = c(6, .8),
    max.words = 500,
    random.order = FALSE,
    colors = colourScheme3$textColour[i]
  )
  dev.off()
}

saveRDS(castBigrams3,
  file = here("data", "bigramsC3.rds")
)
