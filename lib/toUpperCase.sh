#! /bin/bash

function toUpperCase() {
     if [ $# -lt 1 ]; then return; fi

     tr '[a-z]' '[A-Z]' <<< "$1"
}

# Note: double quotes the $1 in case of space in string
# toUpperCase "$1"