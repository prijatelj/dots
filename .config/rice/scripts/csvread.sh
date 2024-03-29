#!/bin/bash
# Outputs column view of the given file with

# Check number args
if [[ "$#" -gt 3 ]]; then
    echo "Expected csvread [-s delimiter] file/path"
    exit 1
fi

# Check if the last argument is a file that exists
if [ ! -f "${@: -1}" ]; then
    echo "ERROR: Given file not found!"
    exit 1
fi

if [[ "$#" -eq 1 ]]; then
    # Number of args is 1: default delimiter is comma
    column -ts, < $1 | less -#2 -N -S
elif [[ "$1" -eq "-t" ]]; then
    # Delimiter to use is tab
    column -ts $'\t' < $2 | less -#2 -N -S
elif [[ "$1" -eq "-s" ]]; then
    # Uses the given delimiter, which follows '-s'
    column -ts $2 < $3 | less -#2 -N -S
else
    echo "Expected csvread [-s delimiter] file/path"
    exit 1
fi
