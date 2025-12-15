if not status is-interactive
    return
end


function soffice --wraps /usr/bin/soffice
    if test (count $argv) -eq 1 && test -f $argv
        command soffice $argv &>/dev/null & disown
    end
    command soffice $argv
end
