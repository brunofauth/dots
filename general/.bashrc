# Useful aliases and functions

alias up="cd .."
alias py=python3
alias refresh="source ~/.bashrc"
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
alias bat="bat --plain"
alias indep="bg && disown"
alias psyu="sudo pacman -Syu"
alias pko="sudo pacman -Rns $(pacman -Qqdt) --noconfirm"
alias zathura="zathura --fork"
alias ex="unp -u"
alias cls='printf "\033c"'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

function stripdata { for i in "$@"; do exiftool -all= "$i"; done; } 

function oqeh { xdg-open "http://dicio.com.br/$1"; }
function wtf { man $1 || $1 --help; }

function pi { sudo pacman -S $@ --noconfirm; }
function yi { yay -S $@ --removemake --noconfirm; }

function qaudio {
    tmp=$2
    if [[ -z $tmp ]]; then tmp=1.5; fi
    thd=$3
    if [[ -z $thd ]]; then thd=2%; fi
    sox "$1" "fast-$1" silence 1 0.1 $thd 1 0.1 $thd tempo $tmp : restart
}

function ytdl {
    xclip -selection clipboard -o | youtube-dl -a -
}

function se {
    if [[ -z "$@" ]]; then
        dirs="$SCRIPTS"
    else
        dirs="$@"
    fi

    for file in $(find $dirs -type f | fzf -e -i -m); do
        "$EDITOR" "$file"
    done
}



# BASH SPECIFIC STUFF BELOW
echo "https://cdn.boob.bot/Gifs/17A2.gif" > /dev/null



# Completion for Bash
source <(kitty + complete setup bash)



# Options for bad bash 
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend



[[ $- != *i* ]] && return

colors() {
    local fgc bgc vals seq0

    printf "Color escapes are %s\n" '\e[${value};...;${value}m'
    printf "Values 30..37 are \e[33mforeground colors\e[m\n"
    printf "Values 40..47 are \e[43mbackground colors\e[m\n"
    printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

    # foreground colors
    for fgc in {30..37}; do
        # background colors
        for bgc in {40..47}; do
            fgc=${fgc#37} # white
            bgc=${bgc#40} # black

            vals="${fgc:+$fgc;}${bgc}"
            vals=${vals%%;}

            seq0="${vals:+\e[${vals}m}"
            printf "  %-9s" "${seq0:-(default)}"
            printf " ${seq0}TEXT\e[m"
            printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
        done
        echo; echo
    done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion


