source "$XDG_CONFIG_HOME/aliases.sh"

function pi; sudo pacman -S $argv --noconfirm; end;
function yi; yay -S $argv --removemake --noconfirm; end;

function qaudio
    set tmp $argv[2]
    if test -z $tmp; set tmp 1.5; end
    set thd $argv[3]
    if test -z $thd; set thd 2%; end
    sox "$argv[1]" "fast-$argv[1]" silence 1 0.1 $thd 1 0.1 $thd tempo $tmp : restart
end



# Fish specific configurations

set fish_greeting

kitty + complete setup fish | source

fish_vi_keybindings
bind -s --preset ge backward-word backward-char backward-char
bind -s --preset gE backward-bigword backward-char backward-char

