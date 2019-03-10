

# XDG FOLDER DEFINITIONS

set -x XDG_CACHE_HOME ~/.cache
set -x XDG_CONFIG_HOME ~/.config
set -x XDG_DATA_HOME ~/.local/share



# Make programs comply to XDG spec

set -x BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set -x BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle
set -x BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundle
set -x DOTNET_CLI_HOME "$XDG_RUNTIME_DIR"/dotnet
set -x GEM_HOME "$XDG_DATA_HOME"/gem
set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -x GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -x GTK_RC_FILES "$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -x ICEAUTHORITY "$XDG_CACHE_HOME"/ICEauthority
set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
set -x LESSKEY "$XDG_CONFIG_HOME"/less/lesskey
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/config
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME"/pass
set -x PYLINTHOME "$XDG_CACHE_HOME"/pylint
set -x RANDFILE "$XDG_RUNTIME_DIR"/rnd
set -x WGETRC "$XDG_CONFIG_HOME"/wgetrc
# set -x XAUTHORITY "$XDG_CACHE_DIR"/Xauthority
# set -x XINITRC "$XDG_CONFIG_HOME"/X11/xinitrc
# set -x XSERVERRC "$XDG_CONFIG_HOME"/X11/xserverrc



# Aliases to FORCE these programs to comply

alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""
# alias startx="startx \"$XDG_CONFIG_HOME/X11/xinitrc\""



# Useful aliases and functions

alias py=python3
alias refresh="source ~/.config/fish/config.fish"
alias cls='printf "\033c"'
alias ls="ls --color=auto"
alias servicels='systemctl list-unit-files | grep enabled'
alias myip="curl ipecho.net/plain; echo"
alias pnum="ps -A --no-headers | wc -l"
alias graus='curl http://wttr.in/passo%20fundo?1'
alias poweroof=poweroff
alias pgrep="pgrep -il"
alias pss="pacman -Ss"
alias yss="yay -Ss"

function pi; sudo pacman -S $argv --noconfirm; end;
function yi; yay -S $argv --removemake --noconfirm; end;

function 2diff; sdiff -l $argv | cat -n | grep -v -e '($' | less; end;



# Aliases for  Windows programs

alias overwatch="lutris lutris:rungame/overwatch"



# Exports
set -x QT_QPA_PLATFORMTHEME "qt5ct"
set -x PYTHONSTARTUP "$HOME/Scripts/startup.py"
set -x EDITOR vim
set -x VISUAL vim



# $PATH extensions

set PATH $PATH "~/.local/bin"
set PATH $PATH "/opt/cuda/lib64/"
set PATH $PATH "~/useful-scripts/"



# Fish specific configurations

set fish_greeting



# This enables blur behind terminals on KDE.

set -x PPID (cat /proc/(echo %self)/stat | tr " " "\n")[4]
#      (cat /proc/$PPID/comm)
#if [[ $(ps --no-header -p $PPID -o comm) =~ '^(yakuake)|(kitty)$' ]]; then
#   for wid in $(xdotool search --pid $PPID); do
#       xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
#   done
#fi



kitty + complete setup fish | source




