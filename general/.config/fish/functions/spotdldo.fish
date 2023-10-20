# Defined in - @ line 1
function spotdldo --wraps=spotdl
    echo "this is deprecated, use 'songdl' instead"
    echo

    while read -P 'Query for Song: ' query
        spotdl --output $XDG_MUSIC_DIR --format m4a $argv $query
    end
end
