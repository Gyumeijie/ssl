#!/bin/bash

function contains() {
   if [ $# -lt 2 ]; then return 1; fi

   if [[ "$1" == *$2* ]]; then return 0; fi
   return 1
}


# Note: double quotes the $@ in case of space in string
# contains "$@"
# example: if contains "string" "str"; then echo "yes"; else echo "no"; fi
