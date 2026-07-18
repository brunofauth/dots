function books
    find /usr/local/share/books/ -mindepth 2 -type f \
        | fzf -e -i -m --delimiter=/ --with-nth={-2..} \
        | xargs -r zathura --fork
end
