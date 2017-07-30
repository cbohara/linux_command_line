#!/bin/bash

# Practice validation by checking if file exists in current directory

invalid_input () {
    # echo to STDERR
    echo "Invalid input '$REPLY'" >&2
    # all commands issue value to system upon termination = exit status
    exit 1
}

# read values from STDIN 
# -p will display a prompt
read -p "Enter a filename in current directory > "

# input from read command is assigned to $REPLY if no variable names are specified
# command1 && command2 are executed if and only if command1 is successful
# -z returns true if length of $REPLY is 0
# if $REPLY is an empty string then run invalid_input function which terminates script
[[ -z $REPLY ]] && invalid_input

# (( )) allows for math functions 
# wc -w will write word count to stdout
(( $(echo $REPLY | wc -w) > 1 )) && invalid_input

# ^ match the beginning of the string and $ match the end of the filename
# [ ] match any character in set including - . _ and [:alnum:] alphanumeric char
# + match 1 or more of preceding token
if [[ $REPLY =~ ^[-[:alnum:]\._]+$ ]]; then
    echo "'$REPLY' is a valid filename."
    if [[ -e $REPLY ]]; then
        echo "And file '$REPLY' exists."
    else
        echo "However file '$REPLY' does not exist."
    fi
fi
