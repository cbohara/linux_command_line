#!/bin/bash -x

# Program to output a system info page

TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIMESTAMP="Generated $CURRENT_TIME, by $USER"

report_uptime () {
    "<h2>System Uptime</h2>
    <pre>$(uptime)</pre>"
    return
}

report_disk_space () {
    echo "<h2>Disk Space Utilization</h2>
    <pre>$(df -h)</pre>"
    return
}

report_home_space () {
    if [[$(id -u) -eq 0 ]]; then
        echo "<h2>Home Space Utilization (All Users)</h2>
        <pre>$(du -sh /Users/*)</pre>"
    else
        echo "<h2>Home Space Utilization ($USER)</h2>
        <pre>$(du -sh $HOME)</pre>"
    fi
    return
}

echo" <html>
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
