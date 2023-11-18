library(tidyverse)
library(here)
library(googlesheets4)
library(lubridate)

# create list of rds files
fileList <- list.files(here("data", "rdsTranscripts"),
  full.names = TRUE,
  pattern = "cr3-\\d+.?\\d*.rds"
)

# create list of main cast members
castList <- c("MATT", "TRAVIS", "MARISHA", "TALIESIN", "SAM", "LIAM", "LAURA", "ASHLEY")

# get gamePlay times from critrolestats

# function to strip data info and format as period
strp_date <- function(x) {
  strptime(x, "%Y-%m-%d %H:%M:%S") %>%
    str_sub(12, -1) %>%
    hms()
}

gs4_deauth()

runTimesC3 <- read_sheet("https://docs.google.com/spreadsheets/d/1OE7QzSfj89xjY-DqXR468as9j6je7UgMulYCSO2Sdp0/edit#gid=1820863997",
  sheet = 1,
  col_types = "ctttttltttt"
)[-c(1:2), ] %>%
  select(Episode, `1st start`, `1st end`, `2nd start`, `2nd end`)

runTimes <- runTimesC3 %>%
  mutate(
    episode = str_extract(Episode, "(?<=E)[:digit:]+(?=$)") %>% as.numeric() %>% as.character(),
    campaign = str_extract(Episode, "(?<=^C)[:digit:]+(?=E)") %>% as.numeric() %>% as.character(),
    across(`1st start`:`2nd end`,
      .fns = strp_date
    )
  ) %>%
  select(episode, campaign, `1st start`:`2nd end`)

# read in rds data as single tibble
datC3 <- fileList %>%
  map_dfr(readRDS) %>%
  left_join(runTimes) %>%
  mutate(gamePlay = (ts >= `1st start` & ts <= `1st end`) | (ts >= `2nd start` & ts <= `2nd end`)) %>%
  select(-`1st start`, -`1st end`, -`2nd start`, -`2nd end`) %>%
  separate(name,
    into = paste0("name", 1:8), # as of C2E120 max of 6 simultaneously, used 8
    sep = ", "
  ) %>%
  pivot_longer(
    cols = name1:name8,
    names_to = "x",
    values_to = "name"
  ) %>%
  filter(!is.na(name)) %>%
  select(-x) %>%
  mutate(
    mainCast = name %in% castList,
    oneShot = str_detect(
      episode,
      "\\."
    )
  )

# save tidy data
saveRDS(
  datC3,
  here("data", "tidyDataC3.rds")
)

# save episode count
episodeCount <- datC3 %>%
  mutate(campaign = campaign %>%
    as.numeric()) %>%
  group_by(campaign) %>%
  summarise(episode = episode %>%
    as.numeric() %>%
    max())

  # save txt file
writeLines(str_c(episodeCount %>% pull(campaign),
                 episodeCount %>% pull(episode),
                 sep = "\t"),
           here("data", "episodeCount.txt"))

  # save RDS file
saveRDS(
  episodeCount,
  here("data", "episodeCount.rds")
)
