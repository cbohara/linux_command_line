#!/bin/bash

# Simple file info program

# convert file_info script below into a shell function
# $0 always contains the full pathname of the first item on the command line
# does not contain the name of the shell function
file_info () {
    if [[ -e $1 ]]; then
        echo -e "\nFile Type:"
        file $1
        echo -e "\nFile Status:"
        stat $1
    else
        echo "$FUNCNAME: usage: $FUNCNAME file" >&2
        return 1
    fi
}

PROGNAME=$(basename $0)

# if first argument contains a file and it exists
if [[ -e $1 ]]; then
    echo -e "\nFile Type:"
    file $1
    echo -e "\nFile Status:"
    stat $1
else
    echo "$PROGNAME: usage: $PROGNAME file" >&2
    exit 1
fi
