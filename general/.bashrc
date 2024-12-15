# Quit if not running in interactive mode
[[ $- != *i* ]] && return


source "$XDG_CONFIG_HOME/aliases.sh"

# Completion for Bash
[ -f /usr/share/bash-completion/bash_completion ] && \
    source /usr/share/bash-completion/bash_completion
source <(kitty + complete setup bash)


# man bash
shopt -s autocd
shopt -s cdspell
shopt -s checkjobs
shopt -s checkwinsize
shopt -s dirspell
shopt -s expand_aliases
shopt -s extglob
shopt -s failglob
shopt -s globstar
shopt -s histappend
shopt -s nocaseglob
shopt -s nocasematch


# https://bash-prompt-generator.org/
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null | xargs -r printf "(%s)\n")'
PS1='\[\e[2m\]\A\[\e[0m\] \[\e[92;1m\]\u\[\e[0m\]@\[\e[96;1m\]\h\[\e[0m\] \[\e[93m\]\w\[\e[0m\] ${PS1_CMD1}\n\\$ '
# PS1='\[\e[90m\]\A\[\e[0m\] \[\e[92;1m\]\u\[\e[0m\]@\[\e[96;1m\]\h\[\e[0m\] \[\e[93m\]\w\[\e[0m\] ${PS1_CMD1}\n\\$ '
# PS1='\[\e[37m\]\A\[\e[0m\] \[\e[92;1m\]\u\[\e[0m\]@\[\e[96;1m\]\h\[\e[0m\] \[\e[93m\]\w\[\e[0m\] ${PS1_CMD1}\n\\$ '
