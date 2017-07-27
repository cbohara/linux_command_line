#!/bin/bash


# Read fields from a file separated by colon IFS

FILE=/etc/passwd

# -p diplay flashing prompt
read -p "Enter a user name > " user_name

# grep contents of file using regex to find line that starts with username:
# save this info into the variable file_info
file_info=$(grep "^$user_name:" $FILE)

# -n returns true if the length of the string is greater than 0
if [ -n "$file_info" ]; then

    # shell allow 1+ variable assignments immediately before a command
    # allows us to assign IFS=":" just before read command
    # IFS (Internal Field Separator) defaults to space, tabs, and newline char
    # alters the environment for the commands that follow then returns to default IFS
    # assignment is temporary = only lasts the duration of the command

    # read command with a list of variable names as arguments

    # <<< indicates here string 
    # like here doc only shorter
    IFS=":" read user pw uid gid name home shell <<< "$file_info"

    echo "User = '$user'"
    echo "UID = '$uid'"
    echo "GID = '$gid'"
    echo "Full Name = '$name'"
    echo "Home directory = '$home'"
    echo "Shell = '$shell'"

else
    echo "No such user '$username'" >&2
    exit 1
fi
