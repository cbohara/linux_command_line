#!/bin/bash

# Program to output a system info page

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
    # %s formats the input argument as a string
    # %8s allows space for 8 chars and %10s allows space for 10 chars
    local format="%8s%10s%10s\n"
    local i dir_list total_files total_dirs total_size user_name
    dir_list=$HOME
    user_name=$USER

    echo "<h2>Home Space Utilization ($USER)</h2>"

    for i in $dir_list; do
        # find recursively descends the directory tree
        # find the current file and count the lines in the file
        total_files=$(find $i -type f | wc -l)
        # find the directories and all files within the directory will be acted on before the dir itself
        total_dirs=$(find $i -type d | wc -l)
        # cut -f will transform each line in the file into a list and cut the first word
        total_size=$(du -sh $i | cut -f 1 )

        echo "<h3>$i</h3>"
        echo "<pre>"
        # printf uses the format to ingest the three following arguments
        printf "$format" "Dirs" "Files" "Size"
        printf "$format" "----" "-----" "----"
        printf "$format" $total_dirs $total_files $total_size
        echo "</pre>"
    done
    return
}

usage () {
    # first option -f file => specify a name for a file to contain the program output
    # second option -i interactive mode => user will be prompted if file already exists = avoid overwrite 
    echo "$PROGNAME: usage: $PROGNAME [-f file | -i ]"
    return
}

write_html_page () {
    echo "
    <html>
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
