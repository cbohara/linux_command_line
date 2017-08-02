#!/bin/bash

# Script to demo common errors

number=

# if accepts a list of commands and evalutes the exit code of the last command in the list
# need to follow [] by a semicolon otherwise the shell will read then and the next echo line as part of the if command

# also should surround $number with quotes because if
# the number variable is empty it will still show up as an empty string
# and the shell can evaluate the binary operator =
if [ "$number" = 1 ]; then
    echo "Number is equal to 1"
else
    echo "Number is not equal to 1"
fi
