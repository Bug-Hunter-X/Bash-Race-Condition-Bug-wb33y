#!/bin/bash

# This script demonstrates a solution to the race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Create a lockfile
lockfile="my.lock"

# Function to write to a file safely
write_to_file() {
  local filename=$1
  local message=$2

  flock -n "$lockfile" || exit 1
  echo "$message" >> "$filename"
  flock -u "$lockfile"
}

# Start two processes concurrently to write to the files
(while true; do message="Process 1 writing to file1.txt; $(date)"; write_to_file file1.txt "$message"; sleep 1; done) &
(while true; do message="Process 2 writing to file2.txt; $(date)"; write_to_file file2.txt "$message"; sleep 1; done) &

# Wait for user input to stop the processes (Ctrl+C)
read -r

# Clean up
kill $!
kill $!
rm -f "$lockfile"

# The solution uses flock to ensure that only one process writes to a file at a time, preventing interleaving.