
# Compatibility with POSIX shells

bass source /etc/profile
# bass source ~/.profile
source (sed -e 's/^export \(\w\+\?\)=\(.\+\)$/set -x \1 \2/' ~/.profile | psub)



# Useful aliases and functions

alias up="cd .."
alias xo=xdg-open
alias py=python3
alias refresh="source ~/.config/fish/config.fish"
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
alias pko="sudo pacman -Rns (pacman -Qqdt) --noconfirm"
alias zathura="zathura --fork"
alias ex="unp -u"
# alias cls='printf "\033[2J\033[H"'
alias cls='printf "\033c"'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

function stripdata; for i in $argv; exiftool -all= $i; end; end

function dicio; xdg-open "http://dicio.com.br/$argv[1]"; end
function wtf; man $argv[1] || $argv[1] --help; end

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

function se
    if test -z "$argv"
        set dirs "$SCRIPTS"
    else
        set dirs "$argv"
    end
    
    for file in (find $dirs -type f | fzf -e -i -m)
        "$EDITOR" "$file"
    end
end



# Fish specific configurations

set fish_greeting

kitty + complete setup fish | source

