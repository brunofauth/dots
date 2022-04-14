# Defined in - @ line 1
function spotdldo --wraps=spotdl
    while read -P 'Query for Song: ' query
        spotdl --output $XDG_MUSIC_DIR --output-format m4a $argv $query
    end
end
