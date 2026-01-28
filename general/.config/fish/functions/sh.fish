if not status is-interactive
    return
end


function sh
    if command -v dash &> /dev/null
        and command -v rlwrap &> /dev/null
        rlwrap --complete-filenames --case-insensitive dash $argv
    else
        command sh $argv
    end
end
