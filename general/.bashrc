# Quit if not running in interactive mode
[[ $- != *i* ]] && return



source "$XDG_CONFIG_HOME/aliases.sh"



# Bad Bash can't use XDG specs
export HISTFILE="$XDG_DATA_HOME"/bash/history


function pi { sudo pacman -S $@ --noconfirm; }
function yi { yay -S $@ --removemake --noconfirm; }

function qaudio {
    tmp=$2
    if [[ -z $tmp ]]; then tmp=1.5; fi
    thd=$3
    if [[ -z $thd ]]; then thd=2%; fi
    sox "$1" "fast-$1" silence 1 0.1 $thd 1 0.1 $thd tempo $tmp : restart
}



# BASH SPECIFIC STUFF BELOW
# "https://cdn.boob.bot/Gifs/17A2.gif"


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
set -o vi



# \e[ : Start color scheme.
# x;y : Color pair to use (x;y)
# \e[m : Stop color scheme.
PS1='\e[34;1m[\e[36m\u\e[34m@\e[36m\h \e[32m\w\e[34m] \e[36m\$ \e[m'
# PS1='\e[36;1m\u\e[34m@\e[36m\h \e[32m\w\e[m $ '

