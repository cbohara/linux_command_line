#!/bin/bash

# Display a series of numbers

count=5

until [[ $count -eq 0 ]]; do
    echo $count
    count=$((count - 1))
done
echo "Blast off!"
