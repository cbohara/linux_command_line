#!/bin/bash

# Find the longest string in a file

# while filename is not an empty string
while [[ -n $1 ]]; do
    # -r if the file exists and is readable 
    if [[ -r $1 ]]; then
        max_word=
        max_len=0
        # strings program generates a list of readable text "words" in each file
        # the for loop processes each word and determines if the current word is the longest so far
        for i in $(strings $1); do
            # echo -n do not print newline
            # will print the number of bytes for each word
            len=$(echo -n $i | wc -c)
            # if the current word is longer than the max_len then replace
            if (( len > max_len )); then
                max_len=$len
                max_word=$i
            fi
        done
        echo "The longest word in $1 is '$max_word' (${max_len//[[:blank:]]/} characters)"
    fi
    # shift will move on to the next argument if there are multiple files to search
    shift
done
