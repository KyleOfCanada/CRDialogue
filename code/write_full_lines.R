library(tidyverse)
library(here)

dat1 <- readRDS(here("data", "tidyDataC1.rds"))
dat2 <- readRDS(here("data", "tidyDataC2.rds"))
dat3 <- readRDS(here("data", "tidyDataC3.rds"))

bind_rows(dat1, dat2, dat3) %>% 
  filter(gamePlay, mainCast, !oneShot) %>% 
  mutate(text = str_c(name, ": ", text),
         text = str_remove_all(text, '"')) %>% 
  select(text) %>% 
  write_delim(here("data", "full_lines.txt"),
              delim = "\n",
              col_names = FALSE)
