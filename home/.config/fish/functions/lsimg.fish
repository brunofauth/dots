function lsimg --wraps="pacman -Ql"
    if test -z $argv[1]
        echo "No package name given" >&2
        return 1
    end
    pacman -Qql $argv[1] | file -if - | grep ' image/\w\{3,4\};' | cut -d: -f1 | xargs -r sxiv -t
end

