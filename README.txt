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

< (less than) and > (greater than)
    must have quotes around them when using test
    otherwise interpreted by shell as redirection operators
    ASCII used for string comparisons
