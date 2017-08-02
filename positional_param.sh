#!/bin/bash

# Script to view command line parameters

# $0 will always contain the first item appearing in the command line = pathname for script
# if you want more than 9 parameters use {} around double digits
# $# variable will contain the number of arguments in the command line
echo "
Number of arguments: $#
\$0 = $0
\$1 = $1
\$2 = $2
\$3 = $3
\$4 = $4
\$5 = $5
\$6 = $6
\$7 = $7
\$8 = $8
\$9 = $9
\$10 = ${10}
"

print_params () {
    echo "\$1 = $1"
    echo "\$2 = $2"
    echo "\$3 = $3"
    echo "\$4 = $4"
}

pass_params () {
    # -e allows echo to interpret backslash escapes
    echo -e "\n" '$* : ';   print_params $*
    echo -e "\n" '"$*" : ';  print_params "$*"
    echo -e "\n" '$@ : ';   print_params $@
    echo -e "\n" '"$@" :';  print_params "$@"
}

pass_params "word" "words with spaces"
