#!/bin/bash

# Program to output a system info page

TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIMESTAMP="Generated $CURRENT_TIME, by $USER"

report_uptime () {
cat << _EOF_
<h2>System Uptime</h2>
<pre>$(uptime)</pre>
_EOF_
return
}

report_disk_space () {
cat << _EOF_
<h2>Disk Space Utilization</h2>
<pre>$(df -h)</pre>
_EOF_
return
}

report_home_space () {
if [[$(id -u) -eq 0 ]]; then
cat << _EOF_
<h2>Home Space Utilization (All Users)</h2>
<pre>$(du -sh /Users/*)</pre>
_EOF_
else
cat << _EOF_
<h2>Home Space Utilization ($USER)</h2>
<pre>$(du -sh $HOME)</pre>
_EOF_
fi
return
}


cat << _EOF_
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
</html>
_EOF_