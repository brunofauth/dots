function doc-sqlite
    find /usr/share/doc/sqlite/ -type f -name \*.html -print0 \
        | fzf -e -i -m --read0 --print0 \
        | xargs -0r -L1 firefox
end

