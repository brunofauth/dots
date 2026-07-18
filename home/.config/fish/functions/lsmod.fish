if not status is-interactive
    return
end

function lsmod --wraps /usr/bin/lsmod
    if command -v bat &>/dev/null
        command lsmod $argv | bat --plain --no-paging --language conf 
    else
        command lsmod $argv
    end
end
