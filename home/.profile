# vim: foldmethod=marker foldlevel=0 foldclose=all


# XDG FOLDER DEFINITIONS {{{
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_DESKTOP_DIR="$HOME/top"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_DOWNLOAD_DIR="$HOME/dl"
export XDG_MUSIC_DIR="$HOME/song"
export XDG_PICTURES_DIR="$HOME/pics"
export XDG_PUBLICSHARE_DIR="$HOME/pub"
export XDG_TEMPLATES_DIR="$HOME/templ"
export XDG_VIDEOS_DIR="$HOME/vids"
# }}} XDG FOLDER DEFINITIONS

# $HOME folder .dotfile cleanup {{{

# Ruby
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem

# export XAUTHORITY="$XDG_CACHE_DIR"/Xauthority
# export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
# export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUPS_CACHEDIR="$XDG_CACHE_DIR/cups"
export CUPS_DATADIR="$XDG_DATA_HOME/cups"
export DOTNET_CLI_HOME="$XDG_RUNTIME_DIR/dotnet"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export QUEUEDIR="$XDG_DATA_HOME/msmtpqueue"
export RANDFILE="$XDG_RUNTIME_DIR/rnd"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export RYE_HOME="$XDG_CACHE_HOME/rye"
export TEXMFVAR="$XDG_DATA_HOME/texlive"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"


alias wget="\
    wget \
	--hsts-file='$XDG_CACHE_HOME/wget-hsts' \
"
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
# }}} $HOME folder .dotfile cleanup

# Default Apps {{{

# Unix standard
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export BROWSER=librewolf
export MANPAGER="sh -c 'col --no-backspaces --spaces | bat --language=man --plain'"
export FILE_MANAGER="pcmanfm"
export SHELL=/bin/sh
export TERMINAL=urxvt

# Non standard
export BROWSER_PRIVATE="librewolf --private"
export DOTFILES="$HOME/dots"
export SCRIPTS="$HOME/scripts"

# }}} Default Apps

# Configs for many programs {{{
export FZF_DEFAULT_OPTS="--reverse -e -i --walker=file,hidden --walker-skip=.cache,.git,node_modules"
export IDF_TOOLS_PATH="$XDG_CACHE_HOME/esp-idf"
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
export MANROFFOPT="-c"
export PIP_REQUIRE_VIRTUALENV=true
export PYTHONPATH="$PYTHONPATH:$SCRIPTS"
export PYTHONSTARTUP="$SCRIPTS/startup.py"
export QT_QPA_PLATFORMTHEME="gtk2"
export SXHKD_SHELL="/bin/sh"
export WINEDLLOVERRIDES="mscoree=d;mshtml=d"
# }}} Configs for many programs

# $PATH extensions {{{
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
# }}} $PATH extensions

# If we're using: systemctl --user enable ssh-agent.socket
is_ssh_agent_socket_enabled=1

if [ "$is_ssh_agent_socket_enabled" -ne 0 ]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
else
    # Start one, and only one at a time, agent.
    if ! pgrep --euid "$USER" ssh-agent > /dev/null; then
        ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
    fi
    # If the variable is not set or has an old value, source its value
    if ! [ -f "$SSH_AUTH_SOCK" ]; then
        source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
    fi
fi

# espup (https://esp-rs.github.io/book/installation/riscv-and-xtensa.html)
rustup_toolchains="$RUSTUP_HOME/toolchains"
export LIBCLANG_PATH="$rustup_toolchains/esp/xtensa-esp32-elf-clang/esp-16.0.4-20231113/esp-clang/lib"
export PATH="$rustup_toolchains/esp/xtensa-esp-elf/esp-13.2.0_20230928/xtensa-esp-elf/bin:$PATH"

# If tmux is installed
#    && we're in a VT (not inside a Xorg session)
#    && we're not already inside tmux
if command -v tmux >/dev/null 2>&1 \
    && [ -n "$PS1" ] \
    && [ -z "$TMUX" ]
then
    exec tmux new-session -A -t main
fi

