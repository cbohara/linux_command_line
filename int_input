#!/bin/bash

# -n suppresses the trailing newline to output
echo -n "Please enter an integer -> "
# read assigns fields from STDIN to specific variables
read int

# [[ expression ]] is an enhanced replacement for test
# allows for regex testing
# if we did not have this string ~= regex and int did not contain an integer > script would fail

# ^ matches the beginning of text for optional (? matches for 0 or 1 of preceeding token) - char
# [0-9] matches numbers in range 0-9
# + matches 1 or more of preceeding [0-9] for integers with multiple digits

if [[ "$int" =~ ^-?[0-9]+$ ]]; then

    # when using (( )) arithmetic truth test do not need to add $ for expansion
    if ((int == 0)); then
        echo "int is zero"
    else
        if ((int < 0)); then
            echo "int is negative"
        else
            echo "int is positive"
        fi

        if (( ((int % 2)) == 0 )); then
            echo "int is even"
        else
            echo "int is odd"
        fi
    fi
else
    # echo to STDERR
    echo "int is not an integer" >&2
    # provide exit status code for failure
    exit 1
fi
