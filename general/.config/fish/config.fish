function qaudio --description "I did this a long time ago and don't remember what it's for."
    # maybe qaudio stands for quick audio and this function makes audio files play faster?
    set tmp $argv[2]
    if test -z $tmp; set tmp 1.5; end
    set thd $argv[3]
    if test -z $thd; set thd 2%; end
    sox "$argv[1]" "fast-$argv[1]" silence 1 0.1 $thd 1 0.1 $thd tempo $tmp : restart
end



set fish_greeting
fish_default_key_bindings

if status --is-interactive
    if pstree -s $fish_pid | grep -q kitty
        kitty + complete setup fish | source
    end
    zoxide init fish | source
    ferium complete fish | source
    register-python-argcomplete --shell fish pipx | source
    rye self completion --shell fish | source
end


source ~/.config/fish/abbrs.fish

