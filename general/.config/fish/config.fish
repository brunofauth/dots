set fish_greeting
fish_default_key_bindings

if status --is-interactive
    cd $HOME
    if pstree -s $fish_pid | grep -q kitty
        kitty + complete setup fish | source
    end
    zoxide init fish | source
    ferium complete fish | source
    register-python-argcomplete --shell fish pipx | source
    rye self completion --shell fish | source
end


source ~/.config/fish/abbrs.fish

