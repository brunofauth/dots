function ewhich \
    --wraps=which \
    --description 'Use $EDITOR on files found by which'

    set file (which -- $argv[1])
    if test -z $file; or ! test -f $file
        return 1
    end

    if test ! \( -r $file \) -o ! \( -w $file \)
        sudo -e $file
    else
        $EDITOR $file
    end
end
