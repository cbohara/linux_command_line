#!/bin/bash

# adding -x after #!/bin/bash will enable tracing for the entire script
# tracing allows us to see the commands performed with expansion applied

# the default leading + sign is contained in the PS4 (prompt string 4) shell variable
# we can adjust it to include the current line number in the script where the trace is performed
export PS4='$LINENO '


number=1

# can also turn on tracing for specific portions of the script
set -x 

# if accepts a list of commands and evalutes the exit code of the last command in the list
# need to follow [] by a semicolon otherwise the shell will read then and the next echo line as part of the if command

# also should surround $number with quotes because if
# the number variable is empty it will still show up as an empty string
# and the shell can evaluate the binary operator =
if [ "$number" = 1 ]; then
    echo "Number is equal to 1"
else
    echo "Number is not equal to 1"
fi

# turns off tracing
set +x 
