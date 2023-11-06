#!/bin/bash

# Set the initial episode and campaign values
episode=1
campaign=1  # Replace with your campaign name

# Check if the episodeCount.txt file exists
if [ -f "./data/episodeCount.txt" ]; then
    # Read the campaign and episode variables from the file
    read -r campaign episode < "./data/episodeCount.txt"
else
    echo "Error: episodeCount.txt not found."
    exit 1
fi

# Now you can use the campaign and episode variables in your script
echo "Campaign: $campaign"
echo "Episode: $episode"

# This script assumes that the episodeCount.txt file 
  # contains the campaign and episode values on the first line.

# Set a counter for limiting downloads (debugging purposes)
counter=5

# Function to download an episode
download_episode() {
    local episode_number="$1"
    local campaign_number="$1"
    local url="https://kryogenix.org/crsearch/html/cr${campaign_number}-${episode_number}.html"
    local download_name="cr${campaign_number}-${episode_number}.html"
    
    # Download the episode using curl
    if curl -o "data/html/${download_name}" "$url"; then
        echo "Downloaded $download_name"
        return 0
    else
        echo "Failed to download $download_name"
        return 1
    fi
}

# Main loop to download episodes
more_episodes=true

while more_episodes; do
    oneshot=$((episode + .01))
    more_oneshots=true
    while more_oneshots; do
        download_episode "$oneshot"
        if [ $? -ne 0 ]; then
            counter=$((counter - 1))
            oneshot=$((oneshot + .01))
        else
            more_oneshots=false
        if [ "$counter" -lt 1 ]; then
            echo "Download limit reached!"
            break
        fi
    done
    episode=$((episode + 1))
    download_episode "episode"
    if [ $? -ne 0 ]; then
        counter=$((counter - 1))
        episode=$((episode + 1))
    else
        more_oneshots=false
    if [ "$counter" -lt 1 ]; then
        echo "Download limit reached!"
        break
    fi
done

# Check if there are new episodes
if [ "$episode" -le $(tail -n 1 episodeCount.txt | cut -f 2) ]; then
    echo "No new episodes available"
    export NEW_EP="FALSE"
else
    export NEW_EP="TRUE"
fi
