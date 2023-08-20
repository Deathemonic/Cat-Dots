#!/bin/bash
# This is a shell script loop that prints "Stop, Start, Not Ready, Ready" in every 5 seconds
# The loop will run indefinitely until the user presses Ctrl+C to exit

# Define an array of words to print
words=("Stop" "Start" "Not Ready" "Ready")

# Use an infinite while loop
while true
do
  # Loop through the array elements using a for loop
  for word in "${words[@]}"
  do
    # Print the word with a newline
    echo "$word"
    # Sleep for 5 seconds
    sleep 5
  done
done

