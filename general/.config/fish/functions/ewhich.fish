function ewhich \
    --wraps=which \
    --description 'Use $EDITOR on files found by which'

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
