# Bad Bash can't use XDG specs

export HISTFILE="$XDG_DATA_HOME"/bash/history



# Useful aliases and functions

alias up="cd .."
alias xo=xdg-open
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
alias pr="pacman --noconfirm -Rcns"
alias yr="yay --noconfirm -Rcns"
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias bat="bat --plain"
alias indep="bg && disown"
alias psyu="sudo pacman -Syu"
alias pko="sudo pacman -Rns $(pacman -Qqdt) --noconfirm"
alias zathura="zathura --fork"
alias ex="unp -u"
alias cls='printf "\033[2J\033[H"'
# alias cls='printf "\033c"'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias ffmpeg='ffmpeg -pattern_type glob'
alias sxiv='sxiv -a'

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



# BASH SPECIFIC STUFF BELOW
# "https://cdn.boob.bot/Gifs/17A2.gif"



# Only run these lines if in interactive mode
[[ $- != *i* ]] && return



# Completion for Bash
COMPLETE_FILE="/usr/share/bash-completion/bash_completion"
[ -r "$COMPLETE_FILE" ] && source "$COMPLETE_FILE"
source <(kitty + complete setup bash)



# Options for bad bash 
shopt -s checkjobs
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend
shopt -s autocd

# \e[ : Start color scheme.
# x;y : Color pair to use (x;y)
# \e[m : Stop color scheme.
PS1='\e[34;1m[\e[36m\u\e[34m@\e[36m\h \e[32m\w\e[34m] \e[36m\$ \e[m'
# PS1='\e[36;1m\u\e[34m@\e[36m\h \e[32m\w\e[m $ '



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

