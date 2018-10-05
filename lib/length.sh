#!/bin/bash

function length() {
   if [ $# -lt 1 ]; then return; fi

   local string=$1
   
   echo ${#string}
}

# Note: double quotes the $1 in case of space in string
# length "$1"
