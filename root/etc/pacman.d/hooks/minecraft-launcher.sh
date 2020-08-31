#! /bin/sh


LAUNCHER=/usr/bin/minecraft-launcher.sh
SHSCRIPT='
#! /bin/sh


TMPDIR="${XDG_CACHE_DIR:-$HOME/.cache}/mc-tmp" /usr/bin/minecraft-launcher --workDir "${XDG_DATA_HOME:-$HOME/.local/share}/minecraft"

'

echo "$SHSCRIPT" > "$LAUNCHER"
chmod +x "$LAUNCHER"


sed \
    -i \
    's|Exec=/opt/minecraft-launcher/minecraft-launcher|Exec=/usr/bin/minecraft-launcher.sh|' \
    /usr/share/applications/minecraft-launcher.desktop


