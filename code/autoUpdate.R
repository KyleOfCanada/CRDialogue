library(tidyverse)
library(here)
library(rvest)
library(lubridate)

# get latest episode numbers
episodeCount <- readRDS(here("data", "episodeCount.rds"))

# get the next episode
campaign <- episodeCount[nrow(episodeCount), 1]
episode <- episodeCount[nrow(episodeCount), 2]

moreEpisodes <- TRUE

# progress through downloading episodes until file not found
counter <- 5 # DEBUG

while (moreEpisodes) {
  oneshot <- episode + .01
  moreOneshots <- TRUE
  while (moreOneshots) {
    oneshotURL <- str_c("https://kryogenix.org/crsearch/html/cr", campaign, "-", oneshot, ".html")
    downloadName <- str_c("cr", campaign, "-", oneshot, ".html")
    oneshotDownloaded <- try(download.file(oneshotURL,
      destfile = here("data", "html", downloadName)
    ))
    if ("try-error" %in% class(oneshotDownloaded) | oneshotDownloaded == 1) {
      moreOneshots <- FALSE
      print("Successful Error!") # DEBUG
    } else {
      oneshot <- oneshot + .01
      counter <- counter - 1 # DEBUG
      if (counter < 1) {
        moreOneshots <- FALSE
        cat("\nDownload limit reached!\n\n")
      } # DEBUG
    }
  }

  episode <- floor(episode) + 1
  nextURL <- str_c("https://kryogenix.org/crsearch/html/cr", campaign, "-", episode, ".html")
  downloadName <- str_c("cr", campaign, "-", episode, ".html")
  fileDownloaded <- try(download.file(nextURL,
    destfile = here("data", "html", downloadName)
  ))
  if ("try-error" %in% class(fileDownloaded) | fileDownloaded == 1) {
    moreEpisodes <- FALSE
    print("Successful Error!") # DEBUG
  }
  counter <- counter - 1 # DEBUG
  if (counter < 1) {
    moreEpisodes <- FALSE
    cat("\nDownload limit reached!\n\n")
    } # DEBUG
}

if (episode == (episodeCount[nrow(episodeCount), 2] + 1)) {
  warning("No new episodes available",
    call. = FALSE
  )
  Sys.setenv(NEW_EP = FALSE)
} else {
  # function to read html files and save as rds

  Sys.setenv(NEW_EP = TRUE)

  htmlHarvest <- function(htmlFile) {
    html <- read_html(htmlFile)

    title <- html %>%
      html_elements("main") %>%
      html_element("h3") %>%
      html_text()

    if (is.na(title)) {
      warning("Transcript not available")
    } else {
      datLines <- html %>%
        html_elements("#lines") %>%
        html_children()

      times <- datLines %>%
        html_attr("id") %>%
        as_tibble() %>%
        rename(ts = value) %>%
        filter(!is.na(ts))

      dat <- datLines %>%
        html_text() %>%
        as_tibble() %>%
        rename(text = value) %>%
        mutate(name = ifelse(str_detect(text, "^# "),
          str_remove(text, "^# "),
          NA
        )) %>%
        fill(name) %>%
        filter(!str_detect(text, "^# ")) %>%
        bind_cols(times) %>%
        mutate(
          text = str_remove(text, " →"),
          ts = hms(ts),
          campaign = str_extract(title, "(?<=^Campaign )\\d+"),
          episode = str_extract(title, "(?<=Episode )\\d+\\.?\\d*$")
        )

      saveFileName <- str_c("cr", str_extract(title, "(?<=^Campaign )\\d+"), "-", str_extract(title, "(?<=Episode )\\d+\\.?\\d*$"), ".rds")

      saveRDS(
        dat,
        here("data", "rdsTranscripts", saveFileName)
      )

      cat(str_c("Saved ", saveFileName, "\n"))
    }
  }

  # read in html files and save as rds
  cat("Reading html files\n")
  list.files(here("data", "html"),
    pattern = "\\.html",
    full.names = TRUE
  ) %>%
    map(htmlHarvest)


  # delete processed html files
  cat("Deleting html files\n")
  list.files(here("data", "html"),
    pattern = "\\.html",
    full.names = TRUE
  ) %>%
    map(file.remove)

  # run R scripts with new episodes
  cat("Wrangling data\n")
  source(here("code", "wrangleDataC3.R"))
  cat("Wordclouds\n")
  runC3Guests <- FALSE # set to TRUE to run code for guests in C3
  source(here("code", "wordCloudsC3.R"))
  cat("Sentiments\n")
  source(here("code", "sentiments.R"))
  cat("Bigrams\n")
  source(here("code", "bigramCloudsC3.R"))
  cat("Okay\n")
  source(here("code", "okayAnalysis.R"))

  # render updated markdown docs
  cat("Rendering rmarkdown files\n")
  rmarkdown::render(here("code", "RmdFiles", "wordCloudsC3.Rmd"),
    output_dir = here("docs")
  )
  rmarkdown::render(here("code", "RmdFiles", "sentiments.Rmd"),
    output_dir = here("docs")
  )
  rmarkdown::render(here("code", "RmdFiles", "bigramsC3.Rmd"),
    output_dir = here("docs")
  )
  rmarkdown::render(here("code", "RmdFiles", "okay_okay_okay.Rmd"),
    output_dir = here("docs")
  )
  rmarkdown::render(here("code", "RmdFiles", "README.Rmd"),
    output_dir = here()
  )
}
