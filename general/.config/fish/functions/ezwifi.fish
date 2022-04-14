function ezwifi
    if test -z $argv[1]
       return 1
    end
    nmcli device wifi connect $argv[1] password (read -sP "Password: ")
end

