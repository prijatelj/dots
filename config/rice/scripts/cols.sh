#!/bin/bash
# Outputs column view of the given file with

# Check number args
if [[ "$#" -gt 3 ]]; then
    echo "Expected cols file/path [-s delimiter]"
    exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
    echo "ERROR: Given file not found!"
    exit 1
fi


if [[ "$#" -eq 1 ]]; then
    # default delimiter is comma
    column -ts, < $1 | less -#2 -N -S
elif [[ "$2" -eq "-t" ]]; then
    # delimiter is tab
    column -ts $'\t' < $1 | less -#2 -N -S
elif [[ "$2" -eq "-s" ]]; then
    # Given delimiter
    column -ts $3 < $1 | less -#2 -N -S
else
    echo "Expected cols file/path [-s delimiter]"
    exit 1
fi
