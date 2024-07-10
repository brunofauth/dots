function history-gc
    for cmd in ls cd rm mv cp mkdir bmv man men rg zathura firefox es vim
        prompt_user "delete history for '$cmd'?" \
            && history delete --prefix $cmd
    end
end


function prompt_user
    while true
        switch (read --prompt-str="$argv (y/n) ")
            case n no N NO
                return 1
            case y yes Y YES
                return 0
            case *
                echo "Bad input, try again"
        end
    end
end

