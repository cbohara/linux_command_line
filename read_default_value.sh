#!/bin/bash

# Supply default value if user presses the Enter key

read -e -p "What is your username? " -i $USER
echo "You answered: '$REPLY'"
