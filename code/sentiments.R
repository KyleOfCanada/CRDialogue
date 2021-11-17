library(tidyverse)
library(tidytext)
library(textdata)
library(here)
library(knitr)
library(fmsb)

#### load tidy data ####
datC1 <- readRDS(here("data", "tidyDataC1.rds"))
datC2 <- readRDS(here("data", "tidyDataC2.rds"))
datC3 <- readRDS(here("data", "tidyDataC3.rds"))

dat <- bind_rows(datC1, datC2, datC3) %>%
  filter(
    !oneShot,
    gamePlay
  )

dat_nrc <- lexicon_nrc(dir = here("cache", "tidytext"), manual_download = TRUE)
dat_bing <- lexicon_bing(dir = here("cache", "tidytext"), manual_download = TRUE)
dat_afinn <- lexicon_afinn(dir = here("cache", "tidytext"), manual_download = TRUE)

#### tokenize text, get sentiments, calc sentiment frequencies ####

negatorWords <- nma_words %>%
  filter(modifier == "negator")

datNRC <- dat %>%
  filter(mainCast) %>%
  select(name, campaign, episode, text) %>%
  unnest_tokens(sentence,
    text,
    token = "sentences"
  ) %>%
  mutate(sentenceNumber = row_number()) %>%
  unnest_tokens(word, sentence) %>%
  group_by(sentenceNumber) %>%
  mutate(negated = lag(word) %in% negatorWords$word) %>%
  inner_join(dat_nrc)


totalSentiments <- datNRC %>%
  filter(name != "MATT") %>%
  group_by(name) %>%
  count(sentiment) %>%
  mutate(
    castTot = sum(n),
    castSentimentFreq = n / castTot
  ) %>%
  group_by(sentiment) %>%
  mutate(globalSentimentN = sum(n)) %>%
  ungroup() %>%
  mutate(
    globalTot = sum(n),
    globalFreq = globalSentimentN / globalTot,
    castSentUniquness = castSentimentFreq / globalFreq,
    sentiment = fct_infreq(sentiment)
  )

totalSentiments %>%
  ggplot(aes(
    x = sentiment,
    y = castSentUniquness
  )) +
  geom_hline(
    yintercept = 1,
    linetype = "dashed"
  ) +
  geom_col(fill = "grey50") +
  facet_wrap(~name) +
  theme(axis.text.x = element_text(angle = 90))

#### positive vs negative sentiments ####

datBing <- dat %>%
  filter(mainCast) %>%
  select(name, campaign, episode, text) %>%
  unnest_tokens(sentence,
    text,
    token = "sentences"
  ) %>%
  mutate(sentenceNumber = row_number()) %>%
  unnest_tokens(word, sentence) %>%
  group_by(sentenceNumber) %>%
  mutate(negated = lag(word) %in% negatorWords$word) %>%
  inner_join(dat_bing) %>%
  mutate(sentiment = ifelse(negated,
    ifelse(sentiment == "positive",
      "negative",
      "positive"
    ),
    sentiment
  ))

posNeg <- datBing %>%
  filter(
    name != "MATT",
    sentiment %in% c("positive", "negative")
  ) %>%
  group_by(name, sentiment) %>%
  count(sentiment) %>%
  pivot_wider(name,
    names_from = sentiment,
    values_from = n
  ) %>%
  mutate(ratio = positive / negative) %>%
  arrange(desc(ratio))

datAfinn <- dat %>%
  filter(mainCast) %>%
  select(name, campaign, episode, text) %>%
  unnest_tokens(word, text) %>%
  inner_join(dat_afinn)

posNeg2 <- datAfinn %>%
  filter(name != "MATT") %>%
  group_by(name) %>%
  summarise(meanValue = mean(value))

plotPosNeg <- posNeg %>%
  mutate(name = factor(name,
    levels = c("TRAVIS", "MARISHA", "LIAM", "TALIESIN", "SAM", "ASHLEY", "LAURA", "ROBBIE")
  )) %>%
  ggplot(aes(
    x = name,
    y = ratio
  )) +
  geom_col(fill = "darkgreen") +
  geom_text(aes(
    label = str_to_title(name),
    y = 0
  ),
  hjust = 0,
  nudge_y = .05,
  fontface = "bold",
  size = rel(5),
  colour = "white"
  ) +
  coord_flip() +
  theme_classic() +
  scale_y_continuous(expand = expansion(mult = c(0, .1))) +
  labs(
    x = NULL,
    y = "Positive to Negative Word Ratio",
    title = "Positive versus Negative Sentiment"
  ) +
  theme(
    axis.text.y = element_blank(),
    axis.text.x = element_text(colour = "white"),
    axis.title = element_text(colour = "white"),
    axis.ticks.y = element_blank(),
    axis.ticks.x = element_line(colour = "white"),
    axis.line = element_line(colour = "white"),
    plot.title = element_text(colour = "white"),
    plot.background = element_rect(fill = "#23272A"),
    panel.background = element_rect(fill = "#23272A")
  )

ggsave(here("plots", "positiveNegativePlot.png"),
  plot = plotPosNeg,
  width = 8.5,
  height = 5
)

sentimentPosNegTable <- posNeg %>%
  mutate(name = str_to_title(name)) %>%
  select(
    Name = name,
    Negative = negative,
    Positive = positive,
    Ratio = ratio
  ) %>%
  kable(
    format = "pipe",
    digits = 2
  )

#### joy vs  sadness ####

joySad <- datNRC %>%
  filter(
    name != "MATT",
    !negated,
    sentiment %in% c("joy", "sadness")
  ) %>%
  group_by(name, sentiment) %>%
  count(sentiment) %>%
  pivot_wider(name,
    names_from = sentiment,
    values_from = n
  ) %>%
  mutate(ratio = joy / sadness) %>%
  arrange(desc(ratio))

plotJoySad <- joySad %>%
  mutate(name = factor(name,
    levels = c("TALIESIN", "TRAVIS", "LIAM", "MARISHA", "SAM", "LAURA", "ASHLEY", "ROBBIE")
  )) %>%
  ggplot(aes(
    x = name,
    y = ratio
  )) +
  geom_col(fill = "darkgreen") +
  geom_text(aes(
    label = str_to_title(name),
    y = 0
  ),
  hjust = 0,
  nudge_y = .05,
  fontface = "bold",
  size = rel(5),
  colour = "white"
  ) +
  coord_flip() +
  theme_classic() +
  scale_y_continuous(expand = expansion(mult = c(0, .1))) +
  labs(
    x = NULL,
    y = "Joy to Sadness Word Ratio",
    title = "Joyful versus Sadness Sentiment"
  ) +
  theme(
    axis.text.y = element_blank(),
    axis.text.x = element_text(colour = "white"),
    axis.title = element_text(colour = "white"),
    axis.ticks.y = element_blank(),
    axis.ticks.x = element_line(colour = "white"),
    axis.line = element_line(colour = "white"),
    plot.title = element_text(colour = "white"),
    plot.background = element_rect(fill = "#23272A"),
    panel.background = element_rect(fill = "#23272A")
  )

ggsave(here("plots", "joySadPlot.png"),
  plot = plotJoySad,
  width = 8.5,
  height = 5
)

sentimentJoySadTable <- joySad %>%
  mutate(name = str_to_title(name)) %>%
  select(
    Name = name,
    Joy = joy,
    Sadness = sadness,
    Ratio = ratio
  ) %>%
  kable(
    format = "pipe",
    digits = 2
  )

save(sentimentPosNegTable, sentimentJoySadTable,
  file = here("data", "sentimentTables.RData")
)

#### Spider plots ####

datSpider <- datNRC %>%
  filter(
    !(sentiment %in% c("positive", "negative")),
    !negated
  ) %>%
  group_by(name, campaign, sentiment) %>%
  count() %>%
  group_by(name, campaign) %>%
  mutate(
    N = sum(n),
    ratio = n / N
  )

# min .05, max .2
maxdf <- tibble(Anger = c(.05, .2), Anticipation = c(.05, .2), Disgust = c(.05, .2), Fear = c(.05, .2), Joy = c(.05, .2), Sadness = c(.05, .2), Surprise = c(.05, .2), Trust = c(.05, .2))

for (i in unique(datSpider$name)) {
  if (i == "ROBBIE") next
  
  tmpDat <- datSpider %>%
    filter(name == i) %>%
    mutate(sentiment = str_to_title(sentiment)) %>%
    ungroup() %>%
    select(campaign, sentiment, ratio) %>%
    pivot_wider(campaign,
      names_from = sentiment,
      values_from = ratio
    ) %>%
    select(Anger, Anticipation, Disgust, Fear, Joy, Sadness, Surprise, Trust)

  tmpDat <- as.data.frame(bind_rows(maxdf, tmpDat))

  rownames(tmpDat) <- c("min", "max", "Campaign 1", "Campaign 2", "Campaign 3")

  png(
    filename = here("plots", "spiderPlots", paste0(i, ".png")),
    bg = "white"
  )

  radarchart(tmpDat,
    title = str_to_title(i),
    pfcol = c(rgb(0.2, 0.5, 0.5, 0.4), rgb(0.2, 0.2, 0.8, 0.4), rgb(0, 0.5, 1, 0.4)),
    pcol = "grey30",
    pty = 32,
    plty = "solid",
    cglcol = "grey30"
  )

  legend(
    x = 0.65,
    y = 1.35,
    legend = rownames(tmpDat[-c(1, 2), ]),
    bty = "n",
    pch = 20,
    col = c(rgb(0.2, 0.5, 0.5, 0.4), rgb(0.2, 0.2, 0.8, 0.4), rgb(0, 0.5, 1, 0.4)),
    text.col = "grey30",
    cex = 1.2,
    pt.cex = 3
  )

  dev.off()
}

# overall spiderplot

datSpiderOverall <- datNRC %>%
  filter(
    !(sentiment %in% c("positive", "negative")),
    !negated
  ) %>%
  group_by(campaign, sentiment) %>%
  count() %>%
  group_by(campaign) %>%
  mutate(
    N = sum(n),
    ratio = n / N,
    sentiment = str_to_title(sentiment)
  ) %>%
  ungroup() %>%
  select(campaign, sentiment, ratio) %>%
  pivot_wider(campaign,
    names_from = sentiment,
    values_from = ratio
  ) %>%
  select(Anger, Anticipation, Disgust, Fear, Joy, Sadness, Surprise, Trust)

datdatSpiderOverall <- as.data.frame(bind_rows(maxdf, datSpiderOverall))

rownames(datdatSpiderOverall) <- c("min", "max", "Campaign 1", "Campaign 2", "Campaign 3")

png(
  filename = here("plots", "spiderPlots", "Overall.png"),
  bg = "white"
)

radarchart(datdatSpiderOverall,
  title = "Overall",
  pfcol = c(rgb(0.2, 0.5, 0.5, 0.4), rgb(0.2, 0.2, 0.8, 0.4), rgb(0, 0.5, 1, 0.4)),
  pcol = "grey30",
  pty = 32,
  plty = "solid",
  cglcol = "grey30"
)

legend(
  x = 0.65,
  y = 1.35,
  legend = rownames(datdatSpiderOverall[-c(1, 2), ]),
  bty = "n",
  pch = 20,
  col = c(rgb(0.2, 0.5, 0.5, 0.4), rgb(0.2, 0.2, 0.8, 0.4), rgb(0, 0.5, 1, 0.4)),
  text.col = "grey30",
  cex = 1.2,
  pt.cex = 3
)

dev.off()
