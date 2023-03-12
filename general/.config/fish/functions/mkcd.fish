function mkcd --description "'mkdir -p' a dir if it doesn't exist and, after, 'cd' into it"
    test -d $argv[1] || mkdir -p $argv[1] || exit
    cd $argv[1]
end

