if not status --is-interactive
    return
end


function vim --wraps=vim

    if ps -o ppid= | string trim | xargs -I {} cat /proc/{}/comm 2>/dev/null | grep -q vim
        printf "Can't spawn nested vim instances"
        return 1
    end

    command vim $argv
end

