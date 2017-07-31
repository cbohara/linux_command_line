#!/bin/bash

# sort by first column and pipe to loop
sort -k 1 testing.txt | while read name age; do
    printf "Name: %s\t Age: %s\n" \
    $name \
    $age
done
