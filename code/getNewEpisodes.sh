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
    local campaign_number="$1"
    local episode_number="$2"
    local url="https://www.kryogenix.org/crsearch/html/cr${campaign_number}-${episode_number}.html"
    local download_name="cr${campaign_number}-${episode_number}.html"
    
    # Use curl with -I to send a HEAD request and get the HTTP headers
    http_headers=$(curl -I "$url" 2>&1)
    
    # Extract the HTTP status code from the headers
    http_status_code=$(echo "$http_headers" | grep -i -m 1 "HTTP/1.1" | awk '{print $2}')
    
    # Check HTTP status and download if 200
    if [ "$http_status_code" = "404" ]; then
        echo "HTTP 404 Error: Episode not found: $campaign_number - $episode_number"
        return 1
    elif [ "$http_status_code" = "200" ]; then
        # Download the episode using curl
        if curl -o "data/html/${download_name}" "$url"; then
            echo "Downloaded $download_name"
            return 0
        else
            local exit_code=$?
            echo "Failed to download $download_name (Exit Code: $exit_code)"
            return $exit_code
        fi
    else
        echo "HTTP Error: Unexpected status code $http_status_code"
        return 1
    fi
}

# Main loop to download episodes
more_episodes=true
downloaded_episodes=false

while $more_episodes
  do
    # Check for oneshot episodes
    oneshot=$(echo "$episode + 0.01" | bc)
    more_oneshots=true
    while $more_oneshots
      do
        download_episode "$campaign" "$oneshot"
        if [ $? == 0 ]; then
            counter=$((counter - 1))
            oneshot=$(echo "$oneshot + 0.01" | bc)
            downloaded_episodes=true
        else
            more_oneshots=false
        fi

        if [ "$counter" -lt 1 ]; then
            echo "Download limit reached!"
            break
        fi
      done

    # Check for main episodes
    episode=$((episode + 1))
    download_episode "$campaign" "$episode"
    if [ $? == 0 ]; then
        counter=$((counter - 1))
        episode=$((episode + 1))
        downloaded_episodes=true
    else
        more_oneshots=false
    fi
    
    if [ "$counter" -lt 1 ]; then
        echo "Download limit reached!"
        break
    fi
  done

# Check if new episodes were downloaded
if [ "$downloaded_episodes" ]; then
    echo "New episodes downloaded"
    export NEW_EP="TRUE"
else
    echo "No new episodes available"
    export NEW_EP="FALSE"
fi


#if [ "$episode" -le $(tail -n 1 episodeCount.txt | cut -f 2) ]; then
#    echo "No new episodes available"
#    export NEW_EP="FALSE"
#else
#    export NEW_EP="TRUE"
#fi
