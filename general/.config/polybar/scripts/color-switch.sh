#! /usr/bin/env sh


# cd "$XDG_CONFIG_HOME/polybar" || exit 1
cd .. || exit 1

COLORS=$(ls -1 colorschemes)
HEAD=";; Begin Active Colors"
TAIL=";; End Active Colors"


if [ $# -ge 2 ]; then
    fg="$1"
    if ! echo "$COLORS" | grep -xqe "$fg"; then
        >&2 printf 'Available foregrounds:\n%s\n' "$COLORS"
        exit 1
    fi

    bg="$2"
    if ! printf "light\ndark" | grep -xqe "$bg"; then
        >&2 echo "Available backgrounds: light, dark"
        exit 1
    fi

else
    fg=$(ls -1 colorschemes | sed "s|^| |" | rofi -sep '\n' -dmenu -i -p "Pick Color" | cut -d ' ' -f 2-)
    [ -z "$fg" ] && exit 1

    bg=$(echo " dark| light" | rofi -sep '|' -dmenu -i -p "Pick Color" | cut -d ' ' -f 2-)
    [ -z "$bg" ] && exit 1

fi


sed -i -e "/$HEAD/,/$TAIL/{ /$HEAD/{p; r colorschemes/$fg
    }; /$TAIL/p; d}" colors.ini

if [ "$bg" = "dark" ]; then
    sed -i -e "s/fg = .*/fg = #FFf5f5f5/" -e "s/bg = .*/bg = #9A252525/" colors.ini
elif [ "$bg" = "light" ]; then
    sed -i -e "s/fg = .*/fg = #FF252525/" -e "s/bg = .*/bg = #9Af5f5f5/" colors.ini
fi


polybar-msg cmd restart

