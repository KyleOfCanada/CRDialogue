library(tidyverse)
library(here)
library(rvest)
library(lubridate)

# Function to convert html to tidy, save as RDS
htmlHarvest <- function(htmlFile) {
  cat(str_c("Harvesting ", htmlFile, "\n"))
  
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
  walk(~ cat(str_c("\tFile: ", .x, "\n"))) %>%
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

