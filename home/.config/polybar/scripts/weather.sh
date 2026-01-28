#! /bin/sh

data="$(curl -s 'wttr.in/?format=1')" 
status=$?

[ "$status" -ne 0 ] && {
    echo "󱔱"
    exit 1
}
echo "$data" | grep -q '<html>' && {
    echo "󱔱"
    exit 2
}
echo "$data"

