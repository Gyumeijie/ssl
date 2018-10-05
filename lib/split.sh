#! /bin/bash

# split(string, ?separator, ?limit)
# @Usage: array=($(split string ?separator ?limit))
function split() {
   if [ $# -lt 1 ]; then return; fi 
   
   local string=$1  separator=$2 limit=$3
   local q="\""
   local template=""

   # Note: when the separator is "", it extract every single character, So in this case
   # we don't escape \n, since after escaped, the \n becomes two characters: '\' and 'n'
   if [ ! "$separator" = \"\" ] ;then
      # Escape \n, for later we will us \n as seperator for awk_stdout
      string=$(sed 's/\\n/\\\\n/g' <<<"$string")
   fi

   if [ $# -lt 2 ]; then
      template="split(${q}$string${q}, array);"
   else
      local len=${#separator}
      local start=${separator:0:1} end=${separator:$((len-1)):1}

      if [ "$start" = "/" ] && [ "$end" = "/" ]; then 
         # The separator is regexp
         template="split(${q}$string${q}, array, $separator);"
      else
         # The separator is string
         # Note: the awk will unexpectedly treat "-+" as an regexp, so we need to 
         # escape such special characters. After escaped, these special characters
         # are prefixed with two "\"
         separator=$(sed 's/\([\/+*?{}\[]\)/\\\\\1/g' <<<"$separator")
         template="split(${q}$string${q}, array, ${q}$separator${q});"
      fi
   fi

   local awk_stdout=$(eval "awk 'BEGIN { 
                                   $template
                                   len = length(array)
                                   for (i=1; i<=len; i++) {
                                     print array[i]
                                   }
                                   
                                }' 2>/dev/null")
   
   # Determine how many parts of result to ouput, the default is all parts
   local count=$(echo "$awk_stdout" | wc -l)
   local limit=${limit:=$count}
   if [ $limit -gt $count ]; then
      limit=$count
   fi 
   echo "$awk_stdout" | head -n $limit
}

# split "$1" $2 $3
# @example ./split.sh "hello world" '""' 5
# @example ./split.sh "he;is-a-good;boy" "/[;-]/" 