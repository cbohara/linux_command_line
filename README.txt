Notes from the book The Linux Command Line by William Shotts
http://linuxcommand.org/tlcl.php

shell = program that takes keyboard commands and passes them to the OS to carry out
terminal = program used to interact with the shell

processes
    modern OS are usually multitasking 
    create the illusion of doing more than 1 thing at once
    rapidly switching from 1 executing program to another
    
    processes = how linux kernel different processes waiting their turn at the CPU
    each process assigned a process ID (PID)

    when a system starts up the kernel initiates its own activities as processes + launches init
    init program runs a series of shell scripts called init scripts > start all system services
    init = first process = always gets PID 1

    ps x will show PID and status
    px aux will show more info about CPU and memory usage

    top will show the most recent running processes
    highest PID number = the most recent process kicked off

    to get the shell prompt back without terminating a program > put the program in the background using &
    ex: xlogo &
        xlogo program launched into background
        job control will display [job #] PID in stdout
        ex: [1] 1262

    jobs command will list jobs launched from the terminal

    return process to foreground using fg
    ex: fg %1
        fg command is followed by %job number
    
signals
    kill [-signal] PID
        doesn't necessarily kill a process
        sends the process a signal
        if no signal is specified then TERM (terminate) signal is sent by default

        kill -HUP PID 
            used by daemon programs to cause a reinitialization 
            program will restart and re-read its config file
        
        kill -INT PID
            INT (interrupt) like ctrl-c
            usually terminates program
        
        kill -KILL PID
            unlike other signals, KILL signal is not sent to the program itself
            the kernel steps in and immediately kills the process
            leaves no opportunity for process to clean up after itself
            KILL should only be used as a last resort 

        kill -TERM PID
            default
            terminates program if it is "alive" enough to receive signals

        kill -STOP PID
            process will pause without terminating
            not sent to the target process
            the kernel steps in a takes care of this

        kill -CONT PID
            will restore a process after the stop signal
    

    ctrl-c
        sends INT (interrupt) signal
    ctrl-z
        sends TSTP (terminal stops) signal
    programs listen for signals and may act on them as they are received

    
     
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

shell allows 1+ variable assignments to take place immediately before a command
the assignment will alter the environment for the duration of the command execution
once the command has completed the varible no longer exists

basic parameters
    $a
        becomes whatever the variable a contains when expanded
    ${a}
        required if the variable is adjacent to other text
        first example below will return blank space because there is no variable $a_file
        ex: $a="foo"; echo "$a_file"; >>> 
            $a="foo"; echo "${a}_file"; >>> foo_file

group command 
    executes all commands in the current shell
    fast and require less memory vs. running one command at a time
    ex: { ls -l; echo "Listing of foo.txt"; cat foo.txt; } > output.txt

temporary files
    use the mktemp program to name and create temporary files
    X is replaced random # and letters
    ex: tempfile=$(mktemp /tmp/foobar.$$.XXXXXXXXXX

