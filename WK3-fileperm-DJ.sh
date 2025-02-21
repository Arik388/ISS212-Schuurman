#Name: Douglas Schuurman
#Date: 2/19/2025
#Class: ISS212
#Assignment: Week 3 Assignment 3
#Notes For Professor / Resources Used
#Utilized ChatGPT for debugging assistance. Left the notes from where it assisted me (Asked to comment where / what it
#changed from my original script) as you can see I like my spaces. I also had a bit of difficulty with reading a directory
#that is why I added another read -p at the start, but I wanted the option to make life easier and Chat recommended
#line 18 setting it as a variable which I think was super neat and hadn't thought of that.




#!/bin/bash

# Prompt user to input directory or use current working directory by default
read -p "Enter directory to scan (leave empty for current directory): " dir
dir=${dir:-$(pwd)}  # Default to current directory if input is empty

echo "Attempting to Scan Directory: $dir"
echo "This scan is looking for world-writable files."
echo ""

found=0  # No spaces around '=' in Bash

# Ensure the directory exists
if [[ ! -d "$dir" ]]; then
  echo "Error: The directory '$dir' does not exist."
  read -p "Press Enter to exit..."
  exit 1
fi

# Loop through the directory checking the files
for file in "$dir"/*; do
  # Skip directories
  if [[ -d "$file" ]]; then  # Space before ']]'
    continue
  fi

  # Get File Permissions using stat
  perm=$(stat -c "%A" "$file")

  # Check if file is world-writable
  if [[ "$perm" =~ ^-..w..w..w ]]; then  # Correct regex
    echo "WARNING: $file has world-writable permissions ($perm)"
    found=1  # No spaces around '='
  fi
done

# If no files meet the search criteria
if [[ $found -eq 0 ]]; then
  echo "No world-writable files found."
fi

# Keep the window open
read -p "Press Enter to exit..."

