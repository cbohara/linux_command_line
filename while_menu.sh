#!/bin/bash

# A menu driven system information program

# number of seconds to display results
DELAY=2

while [[ $REPLY != 0 ]]; do
    clear

cat << _EOF_
Please select:

1. Display system information
2. Display disk space
3. Display home space utilization
0. Quit
_EOF_

    read -p "Enter selection [0-3] > "

    if [[ $REPLY =~ [0-3] ]]; then

        if [[ $REPLY == 1 ]]; then
            echo "Hostname: $HOSTNAME"
            uptime
            sleep $DELAY
        fi

        if [[ $REPLY == 2 ]]; then
            df -h
            sleep $DELAY
        fi

        if [[ $REPLY == 3 ]]; then
            if [[ $(id -u) -eq 0 ]]; then
                echo "Home space utilization (all users)"
                du -sh /Users/*
            else
                echo "Home space utilization ($USER)"
                du -sh $HOME
            fi
            sleep $DELAY
        fi
    fi
done
echo "Program terminated"
