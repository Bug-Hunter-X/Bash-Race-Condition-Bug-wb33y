#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes concurrently to write to the files
(while true; do echo "Process 1 writing to file1.txt"; echo "Process 1" >> file1.txt; sleep 1; done) &
(while true; do echo "Process 2 writing to file2.txt"; echo "Process 2" >> file2.txt; sleep 1; done) &

# Wait for user input to stop the processes (Ctrl+C)
read -r

# Clean up
kill $!
kill $!

# The bug: The output files file1.txt and file2.txt might show interleaved output from both processes,
# leading to unexpected file contents.