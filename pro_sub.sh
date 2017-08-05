#!/bin/bash

# Demo of process substitution

while read attr links owner group size date time filename; do
echo "
    Filename:       $filename
    Size:           $size
    Owner:          $owner
    Group:          $group
    Modified:       $date $time
    Links:          $links
    Attributes:     $attr
"
done < <(ls -l | tail -n 2)
