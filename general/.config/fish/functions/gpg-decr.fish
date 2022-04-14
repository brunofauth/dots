function gpg-decr

    set -l argc (count $argv)
    [ $argc -lt 1 ] && return 1

    # dunno if this line is needed
    set -l out_file

    if [ $argc -lt 2 ]
        if string match --regex --quiet \.gpg\$ $argv[1]
            set out_file (string split --right --max 1 \. $argv[1])[1]
        else
            set out_file (read --prompt-str "Name for decrypted file: ")
        end
    else
        set out_file $argv[2]
    end

    gpg --decrypt $argv[1] | pv -s (du -sb $argv[1] | cut -f1) > $out_file
end

