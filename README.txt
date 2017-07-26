Notes from the book The Linux Command Line by William Shotts
http://linuxcommand.org/tlcl.php

variable=value
    no space!
    shell reads all values as string

function must include at least one command

exit code 
    all commands (including scripts and shell functions we write) issue value to system upon termination
    0 = success
    1 = failure
    echo $? will show exit code in stdout

    ex: exit 1
        will cause the script to end at the point it is caused
        return exit code 1 (failure)
    ex: return 
        no argument passed to return
        exit status defaults to exit status of last command executed in script
    ex: return 1
        returns exit status 1 to the function

< (less than) and > (greater than)
    must have quotes around them when using test
    otherwise interpreted by shell as redirection operators
    ASCII used for string comparisons

test [ ]
    ex: [ -e "$ANSWER" ]
        parameter $ANSWER is surrounded by quotes to ensure the operator is always followed by a string
        avoids potential error of -e being interpreted as a non-null string if $ANSWER is empty


