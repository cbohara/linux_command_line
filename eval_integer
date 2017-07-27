#!/bin/bash

# Evaluate the value of an integer

INT=-5

# -z is true if length of $INT is 0
if [ -z "$INT" ]; then
    # send message to STDERR
    echo "INT is empty" >&2
    # exit out of script with status code 1 for failure
    exit 1
fi

if [ $INT -eq 0 ]; then
    echo "INT is zero"
else
    if [ $INT -lt 0 ]; then
        echo "INT is negative"
    else
        echo "INT is positive"
    fi

    # math expressions can be surrounded by (( )) or [ ]
    if [ $[INT % 2] -eq 0 ]; then
        echo "INT is even"
    else
        echo "INT is odd"
    fi
fi
