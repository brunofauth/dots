# Example usage:
#     find-codebase -type f -print
#     find-codebase -type d -print
function find-codebase --wraps=find
    if test (count $argv) -lt 1
        set -a argv "-print"
    end
    find \( -iname .git \
        -or -iname .svn \
        -or -iname .cvs \
        -or -iname .hg  \
        -or -iname node_modules \
    \) -prune -o $argv
end
