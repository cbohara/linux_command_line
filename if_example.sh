#!/bin/bash

x=5

if [ $x -eq 5 ]; then
    echo "x equals 5."
else
    echo "x does not equal 5."
fi

if true; then
    echo "True returns exit status 0"
fi

if false; then
    echo "It's true"
fi
