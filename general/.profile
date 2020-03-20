# XDG FOLDER DEFINITIONS

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"



# Make programs comply to XDG spec

export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export DOTNET_CLI_HOME="$XDG_RUNTIME_DIR"/dotnet
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export RANDFILE="$XDG_RUNTIME_DIR"/rnd
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
# export XAUTHORITY="$XDG_CACHE_DIR"/Xauthority
# export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
# export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc



# Aliases to FORCE these programs to comply

alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""
# alias startx="startx \"$XDG_CONFIG_HOME/X11/xinitrc\""



# Exports
export QT_QPA_PLATFORMTHEME="qt5ct"
export PYTHONSTARTUP="$SCRIPTS/startup.py"
export PYTHONPATH="$HOME/libs"
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export FZF_DEFAULT_OPTS="--reverse -e -i"
export SCRIPTS="$HOME/scripts"
export DOTFILES="$HOME/dots"
export BROWSER=/usr/bin/qutebrowser



# $PATH extensions

PATH="$SCRIPTS/:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:/opt/cuda/lib64/"

