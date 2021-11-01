#! /bin/sh


while true; do
    # sed is used to remove \uFE0F
    data="$(curl -s 'wttr.in/?format=1')" \
        && { echo "$data" | sed 's|️||'; } && exit

    sleep 5

done

