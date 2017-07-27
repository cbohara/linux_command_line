#!/bin/bash

# Input a secret passphrase

# -t 10 wil terminate input after 10 seconds
# -s will not echo chars to the display as they are typed = useful for passwords
# -p display prompt for input using the string prompt
if read -t 10 -sp "Enter secret passphrase > " secret_pass; then
    # -e use readline to handle input = allows input editing
    echo -e "\nSecret passphrase = '$secret_pass'"
else
    # if input timed out echo to STDERR
    echo -e "\nInput timed out" >&2
    exit 1
fi
