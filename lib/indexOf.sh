#!/bin/bash

# indexOf(string, searchString, ?position)
function indexOf() {
  if [ $# -lt 2 ]; then return; fi 

  local string=$1 searchString=$2 position=$3

  position=${position:=0}
  # If the position is <= 0, no modification on `string`
  if [ $position -gt 0 ]; then 
    local offset=$3
    string=${string:offset}
  fi
 
  # Using here string as input of awk
  awk '{print index(string,  searchString)-1}' string="$string" searchString="$searchString" <<<""
}

# Note: double quotes the $1 and $2 in case of space in string
# indexOf "$1" "$2" $3
