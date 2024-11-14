# vim: foldmethod=marker foldlevel=0


# XDG FOLDER DEFINITIONS {{{

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

# }}}


# Set "HOME"s to programs, so that they dont use ~/.programrc {{{

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
export RANDFILE="$XDG_RUNTIME_DIR"/rnd
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export TEXMFVAR="$XDG_DATA_HOME/texlive"
export CUPS_DATADIR="$XDG_DATA_HOME/cups"
export CUPS_CACHEDIR="$XDG_CACHE_DIR/cups"
export QUEUEDIR="$XDG_DATA_HOME/msmtpqueue"

alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

# }}}


# Exports

export QT_QPA_PLATFORMTHEME="gtk2"
export EDITOR=vim
export VISUAL=vim
export PAGER="less"
# export MANPAGER="sh -c 'col --no-backspaces --spaces | bat --language=man --plain'"
export SHELL=/bin/sh
# export TERMINAL=kitty
# export BROWSER=firefox
# export BROWSER_PRIVATE="firefox --private"
# export FILE_MANAGER="pcmanfm"


# Cfgs for random programs

export SXHKD_SHELL="/bin/sh"
export MANROFFOPT="-c"
export PIP_REQUIRE_VIRTUALENV=true
export FZF_DEFAULT_OPTS="--reverse -e -i --walker=file,hidden --walker-skip=.cache,.git,node_modules"
export WINEDLLOVERRIDES="mscoree=d;mshtml=d"
export LESS="\
    --RAW-CONTROL-CHARS \
    --IGNORE-CASE \
    --QUIET \
    --squeeze-blank-lines \
    --window=-3 \
    --incsearch \
    --use-color \
    --jump-target=4 \
"

