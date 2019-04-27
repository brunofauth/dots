

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

alias up="cd .."
alias py=python3
alias refresh="source ~/.config/fish/config.fish"
alias cls='printf "\033c"'
alias servicels='systemctl list-unit-files | grep enabled'
alias myip="curl ipecho.net/plain; echo"
alias pnum="ps -A --no-headers | wc -l"
alias graus='curl http://wttr.in/passo%20fundo?1'
alias poweroof=poweroff
alias pwoeroff=poweroff
alias pgrep="pgrep -il"
alias pss="pacman -Ss"
alias yss="yay -Ss"
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cat="bat --plain"
alias indep="bg && disown"
alias psyu="sudo pacman -Syu"
alias pko="sudo pacman -Rns (pacman -Qqdt) --noconfirm"
alias zathura="zathura --fork"

function stripdata; for i in $argv; exiftool -all= $i; end; end

function dicio; xdg-open "http://dicio.com.br/$argv[1]"; end
function wtf; man $argv[1] || $argv[1] --help; end

function 2diff; sdiff -l $argv | cat -n | grep -v -e '($' | less; end;

function pi; sudo pacman -S $argv --noconfirm; end;
function yi; yay -S $argv --removemake --noconfirm; end;

function qaudio
    set tmp $argv[2]
    if test -z $tmp; set tmp 1.5; end
    set thd $argv[3]
    if test -z $thd; set thd 2%; end
    sox "$argv[1]" "fast-$argv[1]" silence 1 0.1 $thd 1 0.1 $thd tempo $tmp : restart
end

function ytdl
    xclip -selection clipboard -o | youtube-dl -a -
end

function ex # usage: ex <file>
    if !test -f $argv[1]
        echo "'$argv[1]' is not a valid file!"
        exit 1
    end
    switch $argv[1]
        case '*'.tar.bz2;   tar xjf $argv[1]
        case '*'.tar.gz ;   tar xzf $argv[1]
        case '*'.bz2    ;   bunzip2 $argv[1]
        case '*'.rar    ;   unrar x $argv[1]
        case '*'.gz     ;   gunzip $argv[1]
        case '*'.tar    ;   tar xf $argv[1]
        case '*'.tbz2   ;   tar xjf $argv[1]
        case '*'.tgz    ;   tar xzf $argv[1]
        case '*'.zip    ;   unzip $argv[1]
        case '*'.Z      ;   uncompress $argv[1]
        case '*'.7z     ;   7z x $argv[1]
        case '*'        ;   echo "ex can\'t extract '$argv[1]'"
    end
end

function se
    if test -z "$argv"
        set directories "$HOME/useful-scripts"
    else
        set directories "$argv"
    end
    
    set file (du -a $directories | awk '{$1="";print}' | fzf| sed -E "s|^ ||")
    
    if test -n "$file"
        $EDITOR "$file"
    end
end


# Aliases for  Windows programs

alias overwatch="lutris lutris:rungame/overwatch"



# Exports
set -x QT_QPA_PLATFORMTHEME "qt5ct"
set -x PYTHONSTARTUP "$HOME/useful-scripts/startup.py"
set -x EDITOR vim
set -x VISUAL vim
set -x PAGER vimpager
set -x FZF_DEFAULT_OPTS "--reverse -e -i"



# $PATH extensions

set PATH $PATH "$HOME/.local/bin"
set PATH $PATH "/opt/cuda/lib64/"
set PATH $PATH "$HOME/useful-scripts/"



# Fish specific configurations

set fish_greeting

kitty + complete setup fish | source

