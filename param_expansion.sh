#!/bin/bash

# how to deal with nonexistant and empty variables 

# handle missing positional parameters and assigning default values to parameters using :-
echo "handling missing parameters:"
foo=
echo ${foo:-"substitute value if unset"}
# >>> substitute value if unset
echo $foo
# >>> 

foo=bar
echo ${foo:-"substitute value if unset"}
# >>> bar
echo $foo
# >>> bar

# can have script exit with an error and have content sent to stder using :?
echo "send info to stderr:"
foo=
echo ${foo:?"parameter is empty"}
# >>> bash: foo: parameter is empty
echo $?
# >>> 1 (exit status 1 = failure)
foo=bar
echo ${foo:?"parameter is empty"}
# >>> bar
echo $?
# >>> 0 (exit status 0 = success)
