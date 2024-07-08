#! /bin/sh


/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom --log-level INFO &

# sh -c "sleep 2 && polybar --config ~/.config/polybar/config.ini main " &
# polybar --config ~/.config/polybar/config.ini main &
xwallpaper --zoom ~/.config/wallpaper &
sxhkd &

# System tray icons
nm-applet &
clipit &
xfce4-power-manager --daemon # no ampersand because this forks
system-config-printer-applet &

# run PCManFM as a background daemon to automatically mount removable media
pcmanfm --daemon-mode &
