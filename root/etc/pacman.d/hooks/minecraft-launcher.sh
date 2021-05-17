#! /bin/sh


SCRIPT_PATH=/usr/bin/minecraft-launcher.sh
SCRIPT_DATA='#! /bin/sh


# This is needed because minecraft tries to execute code from /tmp,
# which is not allowed by my /etc/fstab
export TMPDIR="${XDG_CACHE_DIR:-$HOME/.cache}/mc-tmp"

# This is needed because I dont want .folders littering my ~/
minecraft_dir="${XDG_DATA_HOME:-$HOME/.local/share}/minecraft"

/usr/bin/minecraft-launcher --workDir="$minecraft_dir" "$@"

'

echo "$SCRIPT_DATA" > "$SCRIPT_PATH"
chmod +x "$SCRIPT_PATH"


sed \
    -i \
    's|Exec=/opt/minecraft-launcher/minecraft-launcher|Exec=/usr/bin/minecraft-launcher.sh|' \
    /usr/share/applications/minecraft-launcher.desktop


