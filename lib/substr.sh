#!/bin/bash

# substr(string, from, ?length)
function substr() {
  if [ $# -lt 2 ]; then return; fi 

  local string=$1 from=$2 len=$3

  # The default value is the length of the string and if len 
  # is less than 0, the substr method of awk can process properly
  len=${len:=${#string}}

  # Note: the start index in awk is `1`, but our substr treat `0` as its start index
  if [ $from -lt 0 ]; then
     let from=${#string}+$from+1
     if [ $from -lt 0 ]; then let from=1; fi
  else   
     let from=$from+1
  fi
 
  # Using here string as input of awk
  awk '{print substr(string, from, len)}' string="$string" from=$from len=$len <<<""
}

# Note: double quotes the $1 in case of space in string
# substr "$1" $2 $3