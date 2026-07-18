if not status is-interactive
    return
end


if test -z $TMUX; and command -v tmux &> /dev/null; and test $TERM != xterm-kitty
    exec tmux new-session
end

set fish_greeting
fish_default_key_bindings


set __three_months_in_secs 7776000

function __complgen -a cmd
    command -q $cmd; or return
    set -l f $__fish_config_dir/completions/{$cmd}_autogen.fish
    if not test -f $f; or test (math (date +%s) - (path mtime $f)) -gt __three_months_in_secs
        $argv[2..] | tee $f | source
    end
end

__complgen kitty       kitty + complete setup fish
__complgen pipx        register-python-argcomplete --shell fish pipx
__complgen zoxide      zoxide init fish
__complgen ferium      ferium complete fish
__complgen rye         rye self completion --shell fish
__complgen fzf         fzf --fish
__complgen redshiftctl register-python-argcomplete --shell fish ~/scripts/redshiftctl

set -e __three_months_in_secs 7776000
set -e __complgen

