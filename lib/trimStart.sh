#!/bin/bash

function trimStart() {
   if [ $# -lt 1 ]; then return; fi
   
   sed 's/^\s*//' <<< "$1"
}

# Note: double quotes the $1 in case of space in string and if $1 
# includes `$`, please use '' to prevent variable substitution
# @example: ./trimStart.sh '  before$@after  '
# trimStart "$1"