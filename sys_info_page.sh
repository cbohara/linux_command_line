#!/bin/bash

# Program to output a system info page

# name of shell script (sys_info_page.sh)
PROGNAME=$(basename $0)
TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIMESTAMP="Generated $CURRENT_TIME, by $USER"

report_uptime () {
    echo "<h2>System Uptime</h2>
    <pre>$(uptime)</pre>"
    return
}

report_disk_space () {
    echo "<h2>Disk Space Utilization</h2>
    <pre>$(df -h)</pre>"
    return
}

report_home_space () {
    echo "<h2>Home Space Utilization ($USER)</h2>
    <pre>$(du -sh $HOME)</pre>"
    return
}

usage () {
    # first option -f file => specify a name for a file to contain the program output
    # second option -i interactive mode => user will be prompted if file already exists = avoid overwrite 
    echo "$PROGNAME: usage: $PROGNAME [-f file | -i ]"
    return
}

write_html_page () {
    echo "<html>
        <head>
            <title>$TITLE</title>
        </head>
        <body>
            <h1>$TITLE</h1>
            <p>$TIMESTAMP</p>
            $(report_uptime)
            $(report_disk_space)
            $(report_home_space)
        </body>
    </html>"
    return
}

# process command line arguments
interactive=
filename=

# while -n length of arg string is greater than 0
while [[ -n $1 ]]; do
    case $1 in
        # shift will shift the command line argument to the filename
        -f | --file)            shift
                                filename=$1
                                ;;
        -i | --interactive)     interactive=1
                                ;;
        -h | --help)            usage
                                exit
                                ;;
        *)                      usage >&2 
                                exit 1
                                ;;
    esac
    # shift command will advance the positional parameters to ensure the loop will eventually terminate
    shift
done

# interactive mode 

# if the $interactive variable is not empty
if [[ -n $interactive ]]; then
    while true; do
        # pass in read value into filename variable
        read -p "Enter name of output file: " filename
        if [[ -e $filename ]]; then
            read -p "'$filename' exists. Overwrite? [y/n/q] > "
            case $REPLY in 
                # if user chooses to overwrite existing file => break terminates loop
                Y|y) break
                     ;;
                # exit the shell returning the exit status of the lass command executed
                Q|q) echo "Program terminated"
                     exit
                     ;;
                # any other option will cause the loop to continue and prompt the user again
                *)   continue
                     ;;
            esac
        elif [[ -z $filename ]]; then
            continue
        else
            break
        fi
    done
fi

# output html page

# if $filename string not empty
if [[ -n $filename ]]; then
    # touch will fail if invalid pathname is input
    # if new file is successfully created and -f the file exists and is a regular file
    if touch $filename && [[ -f $filename ]]; then
        # cat html into new file
        write_html_page > $filename
    else
        echo "$PROGNAME: Cannot write file '$filename'" >&2
        exit 1
    fi
else
    write_html_page
fi
