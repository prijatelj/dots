#!/bin/bash
# NOTE that this script may not respect scp of multiple sources to one target.

# Check number args
if [[ "$#" -lt 4 ]]; then
    echo "Expects password_filepath scp [options] src dest"
    exit 1
fi

# Check if password file exists
if [ ! -f "$1" ]; then
    echo "Password file not found!"
    exit 1
fi

# $1 is the filepath to the file containing the password
# $2 is scp src's host
# ${@:3:$#-4} is scp's options
# ${@:$#-1} is the src and dest
if [ "$#" -le 4 ]; then
    echo "No options given"
    sshpass -f "$1" scp "$2:${@:$#-1}"
else
    sshpass -f "$1" scp "${@:3:$#-4}" "$2:${@:$#-1}"
fi
