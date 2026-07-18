status is-interactive; or return


if test -z "$TMUX"; and command -q tmux ; and test $TERM != xterm-kitty
    exec tmux new-session
end

set fish_greeting
fish_default_key_bindings


set __three_months_in_secs 7776000

function __complgen -a cmd
    command -q $cmd; or return
    set -l compl_file $__fish_config_dir/completions/{$cmd}_autogen.fish
    if not test -f $compl_file; or test (math (date +%s) - (path mtime $compl_file)) -gt __three_months_in_secs
        $argv[2..] | tee $compl_file | source
    end
end

__complgen kitty       kitty + complete setup fish
__complgen pipx        register-python-argcomplete --shell fish pipx
__complgen zoxide      zoxide init fish
__complgen ferium      ferium complete fish
__complgen rye         rye self completion --shell fish
__complgen fzf         fzf --fish
__complgen redshiftctl register-python-argcomplete --shell fish ~/scripts/redshiftctl

set -e __three_months_in_secs
set -e __complgen

