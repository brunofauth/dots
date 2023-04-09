#! /usr/bin/env sh


cd "$XDG_CONFIG_HOME/polybar" || exit 1


FGS="$(find ./colors/fgs -type f -printf "%f\n")"
BGS="$(find ./colors/bgs -type f -printf "%f\n")"


update_colors() {

    if ! echo "$FGS" | grep -xqe "$1"; then
        >&2 printf 'Available foregrounds:\n%s\n' "$FGS"
        exit 1
    fi
    if ! echo "$BGS" | grep -xqe "$2"; then
        >&2 printf 'Available backgrounds:\n%s\n' "$BGS"
        exit 1
    fi

    cat \
        ./colors/base.ini \
        "./colors/fgs/$1" \
        "./colors/bgs/$2" \
    > ./colors.ini

    polybar-msg cmd restart
}


if [ $# -ge 2 ]; then
    update_colors "$1" "$2"
else
    fg=$(echo "$FGS" | rofi -theme theme.rasi -sep '\n' -dmenu -i -p "Pick Foreground Color")
    [ -z "$fg" ] && { >&2 echo "No fg color picked. Exiting.";  exit 1; }

    bg=$(echo "$BGS" | rofi -theme theme.rasi -sep '\n' -dmenu -i -p "Pick Background Color")
    [ -z "$bg" ] && { >&2 echo "No bg color picked. Exiting.";  exit 1; }

    update_colors "$fg" "$bg"
fi

