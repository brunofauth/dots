#! /bin/sh

data="$(curl -s 'wttr.in/?format=1')" 
status=$?

if [ "$status" -eq 0 ]; then
     echo "$data" | sed 's|️||'
     exit
 else
     echo "Error Fetching Weather!"
fi

