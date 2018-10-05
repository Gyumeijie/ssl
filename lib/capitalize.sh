#! /bin/bash

function capitalize() {
   if [ $# -lt 1 ]; then return; fi

   local string=$1

   local result="$(tr '[a-z]' '[A-Z]' <<< ${string:0:1})${string:1}"
   echo "$result"
}

# Note: double quotes the $1 in case of space in string
# capitalize "$1"