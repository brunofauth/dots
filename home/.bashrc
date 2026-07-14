# Quit if not running in interactive mode
[[ $- != *i* ]] && return


## Completion for Bash
##
## Before sourcing ~/.bashrc, bash sources `/etc/profile`. In Arch Linux (by
## default), `/etc/profile` checks for being run in bash and, if it is, it
## sources `/etc/bash.bashrc`. This system-level bashrc, by default, sources
## /usr/share/bash-completion/bash_completion (if it exists).
##
## If you're not running on a default-configured Bash distribution under Arch
## Linux, consider uncommenting the lines below.
##
# [ -r /usr/share/bash-completion/bash_completion ] \
#     && . /usr/share/bash-completion/bash_completion

if command -v kitty >/dev/null; then
    source <(kitty + complete setup bash)
fi

PS1=
PS1="$PS1"'\[\033[38;2;148;226;213m\]\t\[\033[0m\]'  # Time
PS1="$PS1"' \[\033[38;2;166;227;161m\]\u\[\033[0m\]' # username
PS1="$PS1"'@\[\033[38;2;137;180;250m\]\h\[\033[0m\]' # @hostname
PS1="$PS1"' \[\033[38;2;249;226;175m\]\w\[\033[0m\]' # CWD Path
PS1="$PS1"'\[\033[38;2;205;214;244m\]> \[\033[0m\]'  # >

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set colored-stats on'
bind 'set colored-completion-prefix on'

bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

# man bash
shopt -s autocd
shopt -s cdspell
shopt -s checkjobs
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell
shopt -s expand_aliases
shopt -s extglob
shopt -s failglob
shopt -s globstar
shopt -s histappend
shopt -s nocaseglob
shopt -s nocasematch

