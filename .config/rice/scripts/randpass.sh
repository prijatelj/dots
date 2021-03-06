#!/bin/bash
# creates a random string, good for passwords.

# Check number args
if [[ "$#" -gt 2 ]]; then
    echo "Expected randpass [char_count tr_pattern]"
    exit 1
fi

# Handle character count
if [[ "$#" -ge 1 ]]; then
    # Character count given
    CHAR_COUNT=$1
else
    # Default character count
    CHAR_COUNT=64
fi

# Handle pattern of accepted characters
if [[ "$#" -eq 2 ]]; then
    # Pattern string given and expected as 2nd arg
    PATTERN=$2
else
    # Default pattern
    PATTERN='A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~'
fi

LC_ALL=C tr -dc $PATTERN </dev/urandom | head -c $CHAR_COUNT | xclip -selection c
# TODO save output into clipboard and optionally to std out
