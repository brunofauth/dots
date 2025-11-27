function vim --wraps=vim

    if status --is-interactive
        if ps -o ppid= | string trim | xargs -I {} cat /proc/{}/comm 2>/dev/null | grep -q vim
            printf "Can't spawn nested vim instances"
            return 1
        end
    end

    command vim $argv
    return $status
end

