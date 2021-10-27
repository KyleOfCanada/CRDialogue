library(httr)
library(here)

my_key <- Sys.getenv("IFTTT_KEY") # from GitHub secret

new_ep <- as.logical(Sys.getenv("NEW_EP"))

if(new_ep) {
  # get latest episode numbers
  episodeCount <- readRDS(here("data", "episodeCount.rds"))
  
  # get the next episode
  campaign <- episodeCount[nrow(episodeCount), 1]
  episode <- episodeCount[nrow(episodeCount), 2]
  
  value1 <- paste("Campaign", campaign, sep = "+")
  value2 <- paste("Episode", episode, sep = "+")
  # either + or a %20 will show up as a space in the notification

} else {
  value1 <- "Error"
  value2 <- "No+new+episode"
}

event <- "CRDiaglogue+update"

webhookURL <- paste0("https://maker.ifttt.com/trigger/", event, "/with/key/", my_key, "?&value1=", value1, "&value2=", value2)

POST(webhookURL)
