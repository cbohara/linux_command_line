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

control operators
    command1 && command2
        command1 and command2 are executed if and only if command1 is successful
        ex: mkdir temp && cd temp
            create temp dir and then cd into temp only if mkdir successfully ran
    command1 || command2
        command1 and command2 are executed if and only if command1 is unsuccessful
        command1 successful => don't run command2
        command1 unsuccessful => run command2
        ex: [[ -d temp ]] || mkdir temp
            test for the existance of the directory temp
            if temp does not exist then directory is created 
        ex: [[ -d temp ]] || exit 1
            if the script requires directory temp and it does not exist => exit with status 1

you can't pipe read
    pipelines create subshells
    subshells create copies of the environment for the processes to use while they execute 
    when the process finishes the copy of the environment is destroyed
    therefore a subshell can never alter the environment of its parent processes

