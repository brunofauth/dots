function mv
    git status >/dev/null 2>&1
    set inside_repo $status
    if test $inside_repo -eq 0
        set mv_output (git mv $argv 2>&1)
        set mv_status $status
        if test $mv_status -eq 128
            /usr/bin/mv $argv
        else
            echo $mv_output
            return $mv_status
        end
    else if test $inside_repo -eq 128
        /usr/bin/mv $argv
    else
        echo "'git status' returned an unknown status code: $inside_repo"
        return 1
    end
end

