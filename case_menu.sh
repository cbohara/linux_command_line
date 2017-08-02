#!/bin/bash

clear
echo "
Please select:

A. Display System Information
B. Display Disk Space
C. Display Home Space Utilization
Q. Quit
"

read -p "Enter selection [A, B, C or Q] > "

case $REPLY in
    q|Q)  echo "Program terminated"
        exit
        ;;
    a|A)  echo "Hostname: $HOSTNAME"
        uptime
        ;;
    b|B)  df -h
        ;;
    c|C)  if [[ $(id -u) -eq 0 ]]; then
            echo "Home space utilization (all users)"
            du -sh /Users/*
        else
            echo "Home space utilization ($USER)"
            du -sh $HOME
        fi
        ;;
    *)  echo "Invalid entry" >&2
        exit 1
        ;;
esac
