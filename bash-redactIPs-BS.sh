#!/bin/bash
#! C:\Program Files\Git\bin\sh.exe
#Name:Douglas Schuurman
#Date: 4/1/2025
# ISS 212 CS Scripting - WK 8 TD 6 - Bash & Regex - IP Redaction
# Bash script using Regex -- Redacting data using pattern matching
#

# Uses stream editor and extended regex to search for any IP addresses in the format xxx.xxx.xxx.xxx
#Replace all such occurances with 'Redacted"
#Results written in a new file called access_redacted.log
sed -E 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[REDACTED]/g' access.log > access_redacted.log
#Outputs the message in the terminal to confirm completion
echo "Redacted IP addresses in access.log and saved as access_redacted.log"
