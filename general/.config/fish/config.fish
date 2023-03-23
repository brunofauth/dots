set -x WSL_ALIASES ~/.config/fish/wsl-aliases.fish
if uname -a | grep -q microsoft
    test -f $WSL_ALIASES && source $WSL_ALIASES
end


function qaudio --description "I did this a long time ago and don't remember what it's for."
    set tmp $argv[2]
    if test -z $tmp; set tmp 1.5; end
    set thd $argv[3]
    if test -z $thd; set thd 2%; end
    sox "$argv[1]" "fast-$argv[1]" silence 1 0.1 $thd 1 0.1 $thd tempo $tmp : restart
end



# Fish specific configurations

set fish_greeting

if pstree -s $fish_pid | grep -q kitty
    kitty + complete setup fish | source
end

fish_default_key_bindings


# https://github.com/gazorby/fish-abbreviation-tips
# yss fish-abbreviation-tips

abbr pylint ruff

