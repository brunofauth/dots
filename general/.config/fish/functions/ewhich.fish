function ewhich \
    --wraps='$EDITOR (which $argv[1])' \
    --description 'alias ewhich=$EDITOR (which $argv[1])'

    set files
    for name in $argv
        set file (which $name)
        if test "$EDITOR" = "vim"
            set -a files $file
        else
            $EDITOR $file
        end
    end

    echo $files

    if test "$EDITOR" = "vim"
        $EDITOR -p $files
    end
end
