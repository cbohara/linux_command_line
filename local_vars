#!/bin/bash

# Script to demonstrate local variables

foo=0

funct_1 () {
    local foo=1   # variable foo local to funct_1
    echo "funct_1: foo = $foo"
}

funct_2 () {
    local foo=2   # variable foo local to funct_2
    echo "funct_2: foo = $foo"
}

echo "global: foo = $foo"
funct_1
echo "global: foo = $foo"
funct_2
echo "global: foo = $foo"
