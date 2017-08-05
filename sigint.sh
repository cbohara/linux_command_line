#!/bin/bash

# SIGINT = interupt signal = same as Ctrl-c
exit_on_signal_SIGINT () {
    echo "Script interrupted" 2>&1
    # need exit command to exit the script   
    exit 0
}

trap exit_on_signal_SIGINT SIGINT

for i in {1..5}; do
    echo "Iteration $i of 5"
    sleep 5
done
