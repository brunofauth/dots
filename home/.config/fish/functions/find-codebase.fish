# Example usage:
#     find-codebase -type f -print
#     find-codebase -type d -print
function find-codebase --wraps=find
    set -l gnu_find_actions \
        -print -print0 -fprint -fprint0 -printf -fprintf \
        -exec -execdir -ok -okdir -delete -ls -fls -quit

    set -l has_action 0
    for arg in $argv
        if contains -- $arg $gnu_find_actions
            set has_action 1
            break
        end
    end

    # Here we're appending a default action so that, if it is not supplied by
    # the user, the command line gets one on the branch after '-prune'. This is
    # done because, unless the second branch has an explicit action on the CLI,
    # both branches with have an implicit '-print' and, in our case, the first
    # branch (the pruned one) should result in a no-op, even when it evaluates
    # to true.
    if test $has_action -eq 0
        set -a argv "-print"
    end

    find \
        \( -iname .git \
            -or -iname .svn \
            -or -iname .cvs \
            -or -iname .hg  \
            -or -iname node_modules \
            -or -ipath '*/.claude/worktrees' \
            -or -ipath '*/target/debug/build' \
            -or -ipath '*/target/debug/incremental' \
            -or -ipath '*/target/debug/deps' \
            -or -ipath '*/target/debug/.fingerprint' \
            -or -ipath '*/target/release/build' \
            -or -ipath '*/target/release/incremental' \
            -or -ipath '*/target/release/deps' \
            -or -ipath '*/target/release/.fingerprint' \
        \) -prune \
        -or $argv
end
