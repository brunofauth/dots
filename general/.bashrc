

# XDG FOLDER DEFINITIONS

export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share



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



# Useful aliases and functions

alias py=python3
alias refresh="source ~/.bashrc"
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

function 2diff { sdiff -l $1 $2 | cat -n | grep -v -e '($' | less; }
function permanent { echo "$@" >> .bashrc; }

function pi { sudo pacman -S $@ --noconfirm; }
function yi { yay -S $@ --removemake --noconfirm; }



# Aliases for  Windows programs

alias overwatch="lutris lutris:rungame/overwatch"



# Exports
export QT_QPA_PLATFORMTHEME="qt5ct"
export PYTHONSTARTUP="$HOME/Scripts/startup.py"
export EDITOR=vim
export VISUAL=vim



# $PATH extensions

PATH="$PATH:~/.local/bin"
PATH="$PATH:/opt/cuda/lib64/"
PATH="$PATH:~/useful-scripts/"





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



# This enables blur behind terminals on KDE.

if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty$' ]]; then
    for wid in $(xdotool search --pid $PPID); do
        xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
    done
fi

echo "https://cdn.boob.bot/Gifs/17A2.gif" > /dev/null

source <(kitty + complete setup bash)




