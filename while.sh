#!/bin/bash

# Display a series of numbers

count=1

# as long as the exit status for the command is 0 then the command within the loop is performed
while [[ $count -le 5 ]]; do
    echo $count
    count=$((count + 1))
done
echo "Finished"
