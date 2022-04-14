function read-sh
    for file in $argv
        sed -e '/^export/!d' -e 's/^export \(\w\+\?\)=\(.\+\)$/set -x \1 \2/' "$file" | source
    end
end
