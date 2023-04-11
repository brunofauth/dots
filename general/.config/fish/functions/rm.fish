function rm
    git status >/dev/null 2>&1
    set inside_repo $status
    if test $inside_repo -eq 0
        set rm_output (git rm $argv 2>&1)
        set rm_status $status
        if test $rm_status -eq 128
            /usr/bin/rm $argv
        else
            echo $rm_output
            return $rm_status
        end
    else if test $inside_repo -eq 128
        /usr/bin/rm $argv
    else
        echo "'git status' returned an unknown status code" >&2
        return $rm_status
    end
end


