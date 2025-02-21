#!/bin/bash

#Name: Douglas Schuurman
#Date: 2/16/2025
#Class: ISS212
#Assignment: Week 3 Assignment 3
#Notes For Professor / Resources Used
#ChatGPT for assistance with debugging
#https://devhints.io/bash - cheatsheat for Bash syntax
#Used geekforgeeks as assistance on getting started / quick reference for easy to follow help
#https://www.geeksforgeeks.org/bash-scripting-introduction-to-bash-and-bash-scripting/#google_vignette
#Ran into 2 major issues that I utilized ChatGPT for assistance with. Firstly line 17 I attempted to not hardcode
#the file selection, but git bash did not like my inputs and would never select the file so I had to hardcode it
#Secondly were the proper outputs and the window closing. I'm new to bash and my window kept closing GPT recommended the
#read -p on line 65 to maintain the window with the IPs I orginally printed the results of failed thresholds and the count
#I had not accounted for printing the actual IP associated with the fail which.

#!/bin/bash

# Allows the user to determine the log file path
#read -p "Enter path to log file you'd like to read: " LOG_FILE

#!/bin/bash

# Hardcoded log file path
LOG_FILE="C:/Users/skate/Desktop/ISS212 Assignemnt Folder/Week_3/sim_auth.log"

# Threshold Limit declared
THRESHOLD=5

# Declare associative array for tracking failed attempts
declare -A failed_attempts

# Checking if the file exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Could not find '$LOG_FILE'"
    exit 1
fi

# Reading the file and counting failed attempts per IP
while read -r line; do
    if [[ "$line" =~ Failed ]]; then
        ip=$(echo "$line" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')  # Extracts the correct IP
        if [[ -n "$ip" ]]; then  # Ensures we don't count empty IPs
            ((failed_attempts[$ip]++))
        fi
    fi
done < "$LOG_FILE"

# Output display of flagged IPs
echo "These IPs may indicate brute-force attempts (Threshold: $THRESHOLD)"
found=0
for ip in "${!failed_attempts[@]}"; do
    if ((failed_attempts[$ip] > THRESHOLD )); then
        echo "$ip - ${failed_attempts[$ip]} failed attempts"
        found=1
    fi
done

# Notify if no IPs exceeded the threshold
if [[ $found -eq 0 ]]; then
    echo "No IPs exceeded the brute-force threshold."
fi

# Keep the window open
read -p "Press Enter to exit..."


