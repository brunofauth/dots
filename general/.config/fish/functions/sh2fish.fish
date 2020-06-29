# removes everything that's not an export
# converts exports to fish syntax
function sh2fish
    for file in $argv
        sed \
            -e '/^export/!d' \
            -e 's/^export \(\w\+\?\)=\(.\+\)$/set -x \1 \2/' \
            "$file"
    end
end
