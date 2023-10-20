#! /bin/sh

data="$(curl -s 'wttr.in/?format=1')" 
status=$?

if [ "$status" -ne 0 ]; then
     echo "Error Fetching Weather!"
     >&2 echo "curl returned nonzero status"
elif echo "$data" | grep -q '<html>'; then
     echo "Error Fetching Weather!"
     >&2 echo "requested weather data, receieved html document"
else
     echo "$data" | sed 's|️||'
fi

