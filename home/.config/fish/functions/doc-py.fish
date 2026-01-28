function doc-py
    find /usr/share/doc/python/html/ -type f -name \*.html -print0 \
        | fzf -e -i -m --read0 --print0 \
        | xargs -0r -L1 firefox
end

