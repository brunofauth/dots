#! /bin/sh

data="$(curl -s 'wttr.in/?format=1')" 
status=$?

[ "$status" -ne 0 ] && {
    echo "Error Fetching Weather!"
    exit 1
}
echo "$data" | grep -q '<html>' && {
    echo "Error Fetching Weather (code=$status)"
    exit 2
}
echo "$data" | sed 's|️||'

