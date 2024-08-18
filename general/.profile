# vim: foldmethod=marker foldlevel=0 foldclose=all


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
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export RANDFILE="$XDG_RUNTIME_DIR"/rnd
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
# export XAUTHORITY="$XDG_CACHE_DIR"/Xauthority
# export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
# export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export RYE_HOME="$XDG_CACHE_HOME/rye"
export TEXMFVAR="$XDG_DATA_HOME/texlive"
export CUPS_DATADIR="$XDG_DATA_HOME/cups"
export CUPS_CACHEDIR="$XDG_CACHE_DIR/cups"
export QUEUEDIR="$XDG_DATA_HOME/msmtpqueue"


alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"
alias minecraft-launcher="\
    env TMPDIR='$XDG_CACHE_HOME/minecraft' \
        /usr/bin/minecraft-launcher \
            --workDir '$XDG_DATA_HOME/minecraft' \
"
alias feedthebeast="\
    /usr/bin/feedthebeast \
        --pack-dir '$XDG_DATA_HOME/feedthebeast' \
        --cache-dir '$XDG_CACHE_HOME/feedthebeast' \
"

# }}}


# Exports

export DOTFILES="$HOME/dots"
export SCRIPTS="$HOME/scripts"
export QT_QPA_PLATFORMTHEME="gtk2"
export PYTHONSTARTUP="$SCRIPTS/startup.py"
export PYTHONPATH="$PYTHONPATH:$SCRIPTS"
export EDITOR=vim
export VISUAL=vim
export PAGER="less"
export MANPAGER="sh -c 'col --no-backspaces --spaces | bat --language=man --plain'"
export SHELL=/bin/sh
export TERMINAL=kitty
export BROWSER=firefox
export BROWSER_PRIVATE="firefox --private"
export FILE_MANAGER="pcmanfm"
export IDF_TOOLS_PATH="$XDG_CACHE_HOME/esp-idf"


# $PATH extensions {{{

export PATH="$SCRIPTS/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/cuda/lib64/"
export PATH="$CARGO_HOME/bin:$PATH"

# }}}


# Random programs' cfgs

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



# espup (https://esp-rs.github.io/book/installation/riscv-and-xtensa.html)
rustup_toolchains="$RUSTUP_HOME/toolchains"
export LIBCLANG_PATH="$rustup_toolchains/esp/xtensa-esp32-elf-clang/esp-16.0.4-20231113/esp-clang/lib"
export PATH="$rustup_toolchains/esp/xtensa-esp-elf/esp-13.2.0_20230928/xtensa-esp-elf/bin:$PATH"

