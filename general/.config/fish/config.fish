if not status is-interactive
    return
end


if test -z $TMUX; and command -v tmux &> /dev/null
    exec tmux new-session
end

set fish_greeting
fish_default_key_bindings


if pstree -s $fish_pid | grep -q kitty
    kitty + complete setup fish | source
end

set __three_months_in_secs 7776000


function __mycomplgen_kitty # {{{
    if not pstree -s $fish_pid | grep -q kitty
        return
    end
    set -l compl_file $__fish_config_dir/completions/kitty.fish

    if not test -f $compl_file
        kitty + complete setup fish | tee $compl_file | source
        return
    end

    if test (expr (date +%s) - (stat --format=%Y $compl_file)) -gt $__three_months_in_secs
        kitty + complete setup fish | tee $compl_file | source
        return
    end
end
__mycomplgen_kitty # }}}


function __mycomplgen_pipx # {{{
    if not command -v pipx >/dev/null 2>&1
        return
    end
    set -l compl_file $__fish_config_dir/completions/pipx.fish

    if not test -f $compl_file
        register-python-argcomplete --shell fish pipx | tee $compl_file | source
        return
    end

    if test (expr (date +%s) - (stat --format=%Y $compl_file)) -gt $__three_months_in_secs
        register-python-argcomplete --shell fish pipx | tee $compl_file | source
        return
    end
end
__mycomplgen_pipx # }}}


function __mycomplgen_zoxide # {{{
    if not command -v zoxide >/dev/null 2>&1
        return
    end
    set -l compl_file $__fish_config_dir/completions/zoxide.fish

    if not test -f $compl_file
        zoxide init fish | tee $compl_file | source
        return
    end

    if test (expr (date +%s) - (stat --format=%Y $compl_file)) -gt $__three_months_in_secs
        zoxide init fish | tee $compl_file | source
        return
    end
end
__mycomplgen_zoxide # }}}


function __mycomplgen_ferium # {{{
    if not command -v ferium >/dev/null 2>&1
        return
    end
    set -l compl_file $__fish_config_dir/completions/ferium.fish

    if not test -f $compl_file
        ferium complete fish | tee $compl_file | source
        return
    end

    if test (expr (date +%s) - (stat --format=%Y $compl_file)) -gt $__three_months_in_secs
        ferium complete fish | tee $compl_file | source
        return
    end
end
__mycomplgen_ferium # }}}


function __mycomplgen_rye # {{{
    if not command -v rye >/dev/null 2>&1
        return
    end
    set -l compl_file $__fish_config_dir/completions/rye.fish

    if not test -f $compl_file
        rye self completion --shell fish | tee $compl_file | source
        return
    end

    if test (expr (date +%s) - (stat --format=%Y $compl_file)) -gt $__three_months_in_secs
        rye self completion --shell fish | tee $compl_file | source
        return
    end
end
__mycomplgen_rye # }}}


set -e __three_months_in_secs 7776000
