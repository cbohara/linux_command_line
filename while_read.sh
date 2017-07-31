#!/bin/bash

# Read lines from file

# use read to input the fields from the redirect file
# read will exit after each line is read
while read name age; do
    printf "Name: %s\tAge: %s\n" \
    $name \
    $age
# add redirection operator after done statement
# once a non-zero exit status is reached the loop will terminate
done < testing.txt

