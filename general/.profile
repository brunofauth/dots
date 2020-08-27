# XDG FOLDER DEFINITIONS

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_DESKTOP_DIR="$HOME/top"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_MUSIC_DIR="$HOME/song"
export XDG_PICTURES_DIR="$HOME/pics"
export XDG_PUBLICSHARE_DIR="$HOME/pub"
export XDG_TEMPLATES_DIR="$HOME/templ"
export XDG_VIDEOS_DIR="$HOME/vids"



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
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc



# Aliases to FORCE these programs to comply

alias wget="wget --hsts-file=\"$XDG_CACHE_HOME/wget-hsts\""
# alias startx="startx \"$XDG_CONFIG_HOME/X11/xinitrc\""
alias minecraft-launcher="TMPDIR=\"$XDG_CACHE_HOME/minecraft\" /usr/bin/minecraft-launcher --workDir \"$XDG_DATA_HOME/minecraft\""
alias feedthebeast="/usr/bin/feedthebeast --pack-dir \"$XDG_DATA_HOME/feedthebeast\" --cache-dir \"$XDG_CACHE_HOME/feedthebeast\""



# Exports

export DOTFILES="$HOME/dots"
export SHELL="/usr/bin/fish"
export SCRIPTS="$HOME/scripts"
export QT_QPA_PLATFORMTHEME="qt5ct"
export PYTHONSTARTUP="$SCRIPTS/startup.py"
export PYTHONPATH="$PYTHONPATH:$SCRIPTS"
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export TERMINAL=kitty
export BROWSER=firefox



# $PATH extensions

export PATH="$SCRIPTS/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/cuda/lib64/"



# Android stuff

export ANDROID_HOME=/opt/android-sdk/
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"



# Random programs' cfgs

export PIP_REQUIRE_VIRTUALENV=true
export FZF_DEFAULT_OPTS="--reverse -e -i"

