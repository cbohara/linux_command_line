#!/bin/bash

# Evalute the value of a string

ANSWER=yes

# using quotes around the parameter ensures that the operator is always followed by a string
# -z returns true if length of string is 0
if [ -z "$ANSWER" ]; then
    # echo to STDERR
    echo "There is no answer" >&2
    # exit will exit out of the script and return status code of 1
    exit 1
fi

if [ "$ANSWER" == "yes" ]; then
    echo "The answer is yes"
elif [ "$ANSWER" == "no" ]; then
    echo "The answer is no"
elif [ "$ANSWER" == "maybe" ]; then
    echo "The answer is maybe"
else
    echo "The answer is unknown"
fi
