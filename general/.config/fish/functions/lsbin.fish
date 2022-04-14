function lsbin --wraps="pacman -Ql"
    set -l argc (count $argv)
    [ $argc -lt 1 ] && return 1
    pacman -Ql $argv[1] | grep /usr/bin/. | cut -d " " -f 2
end

