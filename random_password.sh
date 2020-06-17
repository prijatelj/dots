#!/bin/bash
# creates a random string, good for passwords.
# TODO save output into clipboard
# TODO set optinal argument for password length
# TODO set optinal argument for regex of valid characters
LC_ALL=C tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c 64 ; echo
