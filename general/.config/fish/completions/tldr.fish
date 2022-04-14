set binaries (find /usr/bin/ -type f -printf '%f\n')
complete -c tldr -fa "$binaries"
