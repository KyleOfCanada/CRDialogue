library(tidyverse)
library(here)
library(tidytext)
library(googlesheets4)
library(effsize)
library(knitr)

#### load tidy data ####
dat_C1 <- readRDS(here("data", "tidyDataC1.rds"))
dat_C2 <- readRDS(here("data", "tidyDataC2.rds"))
dat <- bind_rows(dat_C1, dat_C2) %>%
  filter(
    !oneShot,
    gamePlay
  )

#### get attendance data ####

gs4_deauth()

att_C1 <- read_sheet("https://docs.google.com/spreadsheets/d/1Zx1N0cQcd1fJadUwar7f2hJ2p61qoX7lctsVaIEa5uM/edit#gid=744793917",
  sheet = 3,
  col_types = "cDnnnnnnnnlnnnlcc"
)[-1, ] %>%
  mutate(
    campaign = "1",
    episode = str_sub(Episode, 4, 6) %>% as.numeric() %>% as.character()
  ) %>%
  select(campaign, episode, Laura:Ashley)

att_C2 <- read_sheet("https://docs.google.com/spreadsheets/d/1E1DfdXJVu9UpGNG29JMHT3ovk8Ol_UTzol40DMzz-rw/edit#gid=1820863997",
  sheet = 3,
  col_types = "cDnnnnnnnlnnnlcc"
)[-1, ] %>%
  mutate(
    campaign = "2",
    episode = str_sub(Episode, 4, 6) %>% as.numeric() %>% as.character()
  ) %>%
  select(campaign, episode, Laura:Ashley)

dat_att <- bind_rows(att_C1, att_C2) %>%
  mutate(
    across(
      Laura:Ashley,
      ~ .x == 1
    ),
    across(
      Laura:Ashley,
      ~ if_else(is.na(.x),
        FALSE,
        .x
      )
    )
  )

att_sum <- dat_att %>%
  mutate(Matt = TRUE) %>%
  summarise(across(
    Laura:Matt,
    ~ sum(.x, na.rm = TRUE)
  )) %>%
  pivot_longer(
    cols = Laura:Matt,
    names_to = "name",
    values_to = "attended"
  )

#### detect and filter okay okay okay ####
ok_trigrams <- dat %>%
  filter(
    mainCast,
    !oneShot
  ) %>%
  unnest_tokens(trigram,
    text,
    token = "ngrams",
    n = 3
  ) %>%
  select(campaign, episode, name, trigram) %>%
  filter(trigram == "okay okay okay") %>%
  left_join(dat_att)

cast_words <- dat %>%
  filter(mainCast, gamePlay, !oneShot) %>%
  unnest_tokens(word,
    text,
    token = "words"
  ) %>%
  group_by(name) %>%
  count(name = "words") %>%
  mutate(name = str_to_title(name))

ok_cast <- ok_trigrams %>%
  group_by(name) %>%
  count(trigram,
    sort = TRUE,
    name = "count"
  ) %>%
  mutate(name = str_to_title(name)) %>%
  select(name, count) %>%
  left_join(att_sum) %>%
  left_join(cast_words) %>%
  mutate(
    `per episode` = count / attended,
    `per word` = count * 3 / words,
    `one in every n words` = 1 / `per word`
  ) %>%
  arrange(desc(`per word`))

sum(ok_cast$count)

ok_cast %>% 
  kable(format = 'pipe',
        digits = c(0, 0, 0, 0, 2, 6, 0)) %>% 
  saveRDS(file = here("data", "ok_cast.rds"))

ok_trigrams %>%
  group_by(campaign, episode) %>%
  count(trigram,
    sort = TRUE
  ) %>%
  ungroup() %>%
  complete(
    episode = 1:141 %>% as.character(),
    campaign = 1:2 %>% as.character(),
    trigram = "okay okay okay",
    fill = list(n = 0)
  ) %>%
  filter(!(campaign == "1" & episode %>% as.numeric() > 115)) %>%
  left_join(dat_att) %>%
  filter(!is.na(Ashley)) %>%
  mutate(counter = episode %>% as.numeric() + if_else(campaign == "2", 115, 0)) %>%
  ggplot(aes(
    x = counter,
    y = n,
    colour = campaign
  )) +
  geom_tile(
    aes(
      fill = Ashley,
      y = 9.5,
      linetype = NA
    ),
    width = 1,
    height = 19,
    show.legend = TRUE,
    alpha = .4
  ) +
  geom_point() +
  geom_smooth() +
  scale_fill_manual(values = c(0, "green"),
                    labels = c("Absent", "Present")) +
  scale_color_manual(values = c("purple", "blue")) +
  coord_cartesian(ylim = c(0, 19)) +
  labs(
    x = "Episode",
    y = '"Okay, Okay, Okay" Count',
    colour = "Campaign"
  ) +
  theme_classic() +
  theme(panel.grid = element_blank())

ggsave(here("plots", "okay_okay_okay.png"),
       height = 1500,
       width = 2550,
       units = "px")

dat_ok <- ok_trigrams %>%
  group_by(campaign, episode) %>%
  count(trigram,
    sort = TRUE
  ) %>%
  ungroup() %>%
  complete(
    episode = 1:141 %>% as.character(),
    campaign = 1:2 %>% as.character(),
    trigram = "okay okay okay",
    fill = list(n = 0)
  ) %>%
  filter(!(campaign == "1" & episode %>% as.numeric() > 115)) %>%
  filter(!(campaign == "1" & episode == "12")) %>%
  left_join(dat_att)

wilcox.test(n ~ Ashley,
  data = dat_ok
)

cohen.d(n ~ Ashley,
  data = dat_ok
)

dat_ok %>%
  group_by(Ashley) %>%
  summarise(n = mean_cl_boot(n))

wilcox.test(n ~ Laura,
  data = dat_ok
)

wilcox.test(n ~ Marisha,
            data = dat_ok
)

library(MuMIn)
options(na.action = "na.fail")
library(modelsummary)

ms <- lm(n ~ Laura + Ashley + Liam + Marisha + Taliesin + Travis + Sam,
  data = dat_ok
)

modelplot(ms,
  coef_omit = "Intercept",
  colour = "red"
) +
  geom_vline(xintercept = 0)

ok_dredge <- dredge(ms)

ok_models <- get.models(
  ok_dredge,
  delta < 2
)

modelplot(ok_models,
  coef_omit = "Intercept"
) +
  geom_vline(
    xintercept = 0,
    colour = "black"
  )


ok_counts <- ok_trigrams %>%
  group_by(campaign, episode) %>%
  count(trigram) %>%
  ungroup() %>%
  complete(
    episode = 1:141 %>% as.character(),
    campaign = 1:2 %>% as.character(),
    trigram = "okay okay okay",
    fill = list(n = 0)
  ) %>%
  filter(!(campaign == "1" & episode %>% as.numeric() > 115))

ok_counts %>%
  group_by(n) %>%
  count(n, sort = TRUE)

ok_counts %>% 
  filter(n == 19)
