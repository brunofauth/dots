alias xo=xdg-open
alias py=python3
alias refresh="source ~/.bashrc"
alias lssvc='systemctl list-unit-files | grep enabled'
alias myip="curl ipecho.net/plain; echo"
alias pnum="ps -A --no-headers | wc -l"
alias graus='curl http://wttr.in/passo%20fundo?1'
alias poweroof=poweroff
alias pwoeroff=poweroff
alias pgrep="pgrep -il"
alias pss="pacman -Ss"
alias yss="yay -Ss"
alias pr="sudo pacman --noconfirm -Rcns"
alias yr="sudo yay --noconfirm -Rcns"
alias psyu="sudo pacman -Syu"
# alias pko="sudo pacman -Rns $(pacman -Qqdt) --noconfirm"
alias df='df -h'
alias free='free -m'
alias bat="bat --plain"
alias indep="bg && disown"
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
