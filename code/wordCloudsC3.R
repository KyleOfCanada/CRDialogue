library(tidyverse)
library(tidytext)
library(textdata)
library(wordcloud)
library(here)

#### load tidy data ####

datC3 <- readRDS(here("data", "tidyDataC3.rds"))

#### campaign 3 ####

castWords3 <- datC3 %>%
  filter(
    mainCast,
    campaign == "3",
    !oneShot,
    gamePlay
  ) %>%
  select(name, text) %>%
  unnest_tokens(word, text) %>%
  filter(!str_detect(
    word,
    "\\d"
  )) %>%
  mutate(word = str_remove_all(word, "'s")) %>%
  count(name, word, sort = TRUE)

totalWords3 <- castWords3 %>%
  group_by(name) %>%
  summarise(total = sum(n))

castWords3 <- castWords3 %>%
  left_join(totalWords3)

castWords3 <- castWords3 %>%
  bind_tf_idf(word, name, n)

castWords3 %>%
  arrange(desc(tf_idf))

colourScheme3 <- tibble(
  name = c("MATT", "LAURA", "MARISHA", "TALIESIN", "LIAM", "SAM", "TRAVIS", "ASHLEY"),
  bgColour = c("#1f9e0b", "#a888bd", "grey", "#507a5d", "#91886c", "#f5cf36", "#46157d", "#2d422c"),
  textColour = c("#6c12a3", "#e8be27", "black", "#3f0b61", "#4bcf1d", "#376482", "#a63b11", "#d14913")
)

for (i in 1:8) {
  tmpDat <- castWords3 %>%
    filter(name == colourScheme3$name[i])

  png(here("plots", "wordClouds", "C3", paste0("C3", colourScheme3$name[i], ".png")),
    width = 720,
    height = 720,
    bg = colourScheme3$bgColour[i]
  )

  wordcloud(str_to_title(tmpDat$word),
    tmpDat$tf_idf,
    scale = c(8, 1),
    max.words = 500,
    random.order = FALSE,
    colors = colourScheme3$textColour[i]
  )
  dev.off()
}

# stats for C3

# total words
totalWords <- datC3 %>%
  filter(
    campaign == "3",
    !oneShot
  ) %>%
  select(name, text) %>%
  unnest_tokens(word, text) %>%
  nrow()

# words per cast member
wordsPerCast <- datC3 %>%
  filter(
    campaign == "3",
    !oneShot,
    name %in% c("MATT", "LAURA", "MARISHA", "TALIESIN", "LIAM", "SAM", "TRAVIS", "ASHLEY")
  ) %>%
  select(name, text) %>%
  unnest_tokens(word, text) %>%
  group_by(name) %>%
  summarise(N = n()) %>%
  arrange(desc(N))

# Ashley
ashleyOk <- castWords3 %>%
  filter(
    word == "okay",
    name == "ASHLEY"
  ) %>%
  select(name, word, n)

ashleyRage <- castWords3 %>%
  filter(
    word == "cast",
    name == "ASHLEY"
  ) %>%
  select(name, word, n)

# Laura
lauraMama <- castWords3 %>%
  filter(
    word %in% c("mama"),
    name == "LAURA"
  ) %>%
  select(name, word, n)

# Liam
liamCast <- castWords3 %>%
  filter(
    word %in% c("cast", "casts", "casting"),
    name == "LIAM"
  ) %>%
  group_by(name, word) %>%
  mutate(word = "cast") %>%
  summarise(n = sum(n))

# Marisha
marishaDope <- castWords3 %>%
  filter(
    word == "dope",
    name == "MARISHA"
  ) %>%
  select(name, word, n)

marishaStunning <- castWords3 %>%
  filter(
    word == "stunning",
    name == "MARISHA"
  ) %>%
  select(name, word, n)

# Matt
mattBegins <- castWords3 %>%
  filter(
    word == "begins",
    name == "MATT"
  ) %>%
  select(name, word, n)

mattRighty <- castWords3 %>%
  filter(
    word == "righty",
    name == "MATT"
  ) %>%
  select(name, word, n)

# Robbie
robbieTraps <- castWords3 %>%
  filter(
    word == "traps",
    name == "ROBBIE"
  ) %>%
  select(name, word, n)

# Sam
samTraps <- castWords3 %>%
  filter(
    word == "traps",
    name == "SAM"
  ) %>%
  select(name, word, n)

# Taliesin
taliesinSuppose <- castWords3 %>%
  filter(
    word == "suppose",
    name == "TALIESIN"
  ) %>%
  select(name, word, n)

taliesinUndead <- castWords3 %>%
  filter(
    word == "undead",
    name == "TALIESIN"
  ) %>%
  select(name, word, n)

# Travis
travisBlast <- castWords3 %>%
  filter(
    word %in% c("blast", "blasts"),
    name == "TRAVIS"
  ) %>%
  group_by(name, word) %>%
  mutate(word = "blast") %>%
  summarise(n = sum(n))

travisFalchion <- castWords3 %>%
  filter(
    word == "falchion",
    name == "TRAVIS"
  ) %>%
  select(name, word, n)

wordcloudStatsC3 <- bind_rows(ashleyOk, ashleyRage, lauraMama, liamCast, marishaDope, marishaStunning, mattBegins, mattRighty, samTraps, taliesinSuppose, taliesinUndead, travisBlast, travisFalchion)

save(totalWords, wordsPerCast, wordcloudStatsC3,
  file = here("data", "cloudStatsC3.RData")
)

#### Guests ####
if (runC3Guests) {
  # campaign 2

  guestsC3 <- c(NULL)

  guestWords3 <- datC3 %>%
    filter(
      campaign == 2,
      !oneShot,
      gamePlay
    ) %>%
    mutate(guest = name %in% guestsC3) %>%
    filter(mainCast | guest) %>%
    select(name, text) %>%
    unnest_tokens(word, text) %>%
    filter(!str_detect(
      word,
      "\\d"
    )) %>%
    mutate(word = str_remove_all(word, "'s")) %>%
    count(name, word, sort = TRUE)

  totalWordsG3 <- guestWords3 %>%
    group_by(name) %>%
    summarise(total = sum(n))

  guestWords3 <- guestWords3 %>%
    left_join(totalWordsG3)

  guestWords3 <- guestWords3 %>%
    bind_tf_idf(word, name, n) %>%
    filter(name %in% guestsC3)

  guestWords3 %>%
    arrange(desc(tf_idf))

  colourSchemeG3 <- tibble(
    name = guestsC3,
    bgColour = "white",
    textColour = "black"
  )

  for (i in 1:nrow(colourSchemeG3)) {
    tmpDat <- guestWords3 %>%
      filter(name == colourSchemeG3$name[i])

    png(here("plots", "wordClouds", "C3", "guests", paste0("C3", colourSchemeG2$name[i], ".png")),
      width = 720,
      height = 720,
      bg = colourSchemeG3$bgColour[i]
    )

    wordcloud(str_to_title(tmpDat$word),
      tmpDat$tf_idf,
      scale = c(8, 1),
      max.words = 500,
      random.order = FALSE,
      colors = colourSchemeG3$textColour[i]
    )
    dev.off()
  }
}


#### overall clouds ####

campWords <- datC3 %>%
  filter(
    !oneShot,
    gamePlay
  ) %>%
  select(campaign, text) %>%
  unnest_tokens(word, text) %>%
  filter(!str_detect(
    word,
    "\\d"
  )) %>%
  mutate(word = str_remove_all(word, "'s")) %>%
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
