#!/bin/bash

# use for loop
for i; do
    # if the file exists and is readable
    if [[ -r $i ]]; then
        max_word= 
        max_len=0
        # strings looks for ASCII strings in a binary file or stdin
        # loop through each word in the file
        for j in $(strings $i); do
            # ${#j} expands to the length of the string
            len=${#j}
            # (( )) is used for arithmetic expansion for number comparison
            if (( len > max_len )); then
                # replace max_len with current max length
                max_len=$len
                # replace max_word with the current word
                max_word=$j
            fi
        done
        # after searching through all words in the file print the max_word
        echo "$i: '$max_word' ($max_len characters)"
    fi
done
