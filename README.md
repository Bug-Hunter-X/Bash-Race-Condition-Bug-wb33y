# Bash Race Condition Bug

This repository demonstrates a race condition bug in a bash script. Two processes concurrently write to separate files, resulting in potentially interleaved output.

## Bug Description
The script uses two processes writing to two different files. However, due to the nature of concurrent execution, these processes may interleave, leading to unexpected or incorrect file contents.  This is a race condition where the outcome depends on the unpredictable timing of the processes.

## How to Reproduce
1. Clone this repository.
2. Run `bug.sh`.
3. Press Ctrl+C to stop the script.
4. Examine `file1.txt` and `file2.txt`.  Note that the contents might not reflect the expected sequential output from each process.

## Solution
The solution addresses the race condition by using appropriate mechanisms for synchronizing concurrent processes to prevent interleaving.  See `bugSolution.sh` for an example. 