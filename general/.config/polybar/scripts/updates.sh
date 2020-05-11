#! /bin/sh


# Export this variable to change the path of the temporary database.
TMP_DB_PATH="${TMP_DB_PATH:-"$(mktemp -dt "update-db-$USER-XXXXXX")"}"
! [ -d "$TMP_DB_PATH" ] && >&2 echo 'Invalid "$TMP_DB_PATH".' && exit 1


PACMAN_DB="$(pacman-conf DBPath)"
[ -d "$PACMAN_DB" ] || { >&2 echo "Can't find pacman db." && exit 1; }


sync_fake_db() {
    fakeroot -- pacman -Sy \
        --dbpath "$TMP_DB_PATH" \
        --logfile /dev/null \
    >/dev/null
    2>&1
}


fetch_updates() {
    trap 'rm -f "$TMP_DB_PATH/db.lck"' INT TERM EXIT
    ln -s "${PACMAN_DB}/local" "$TMP_DB_PATH"
    sync_fake_db || { >&2 echo "Cannot fetch updates" && exit 1; };
    pacman -Quq --dbpath "$TMP_DB_PATH" 2>/dev/null
}


while true; do
    echo " $(fetch_updates | wc -l)"
    sleep 600
done

