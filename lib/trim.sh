#!/bin/bash

function trim() {
   if [ $# -lt 1 ]; then return; fi
   
   sed -e 's/^\s*//' -e 's/\s*$//' <<< "$1"
}

# Note: double quotes the $1 in case of space in string and if $1 
# includes `$`, please use '' to prevent variable substitution
# @example: ./trim.sh '  before$@after  '
# trim "$1"