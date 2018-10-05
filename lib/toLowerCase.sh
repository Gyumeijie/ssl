#! /bin/bash

function toLowerCase() {
     if [ $# -lt 1 ]; then return; fi

     tr '[A-Z]' '[a-z]' <<< "$1"
}

# Note: double quotes the $1 in case of space in string
# toLowerCase "$1"