#!/bin/bash

# Read lines from file

while read name age; do
    printf "Name: %s\tAge: %s\n" \
    $name \
    $age
done < testing.txt
