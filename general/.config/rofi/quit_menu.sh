#! /bin/bash

declare -A commands
commands[Shutdown]="systemctl poweroff"
commands[Reboot]="systemctl reboot"
commands[LogOut]="i3-msg exit"
commands[Lock]="i3lock-fancy"

str=$(echo "${!commands[@]}" | awk '{gsub (" ","\\n"); print $0}')

eval "${commands[$(echo -e "$str" | rofi -dmenu -i -theme onedark -p '')]}"
