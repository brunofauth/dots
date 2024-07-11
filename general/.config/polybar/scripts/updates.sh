#! /bin/sh


updates="$(checkupdates)"
status="$?"

case "$status" in
    0) echo "󰏗 $(echo "$updates" | wc -l)" ;;
    1) exit 1 ;;
    2) echo "󰏗 0" ;;
esac

