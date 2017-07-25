#!/bin/bash

# Evaluate the status of a file

FILE=~/.bash_profile

# -e return true if file exists
if [ -e "$FILE" ]; then
    # -f true if file exists and is regular file
    if [ -f "$FILE" ]; then
        echo "$FILE is a regular file"
    fi
    # -d true if file exists and is directory
    if [ -d "$FILE" ]; then
        echo "$FILE is a directory"
    fi
    # -r true if exists and user has read permissions
    if [ -r "$FILE" ]; then
        echo "$FILE is readable"
    fi
    # -w true if exists and user had write permissions
    if [ -w "$FILE" ]; then
        echo "$FILE is writeable"
    fi
    # -x true if exists and user can execute
    if [ -x "$FILE" ]; then
        echo "$FILE is executable"
    fi
else
    echo "$FILE does not exist"
    # specify exit code to communicate failure
    exit 1
fi 

exit
