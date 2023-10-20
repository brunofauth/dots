function 0x0
    if not test -f $argv[1]
        echo 'Missing or invalid "$argv[1]" (filepath)' > /dev/stderr
        exit 1
    end
    curl --progress-bar -F file=@$argv[1] http://0x0.st
end

