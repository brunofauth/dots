function find-by-gpg-key
    # argv[1] may be $PASSWORD_STORE_DIR
    # argv[2] may be "Bruno", "jorge", etc...
    if [ -z $argv[1] ] || ! [ -d $argv[1] ]
        echo "First argument must point to a directory"
        return 1
    end
    if [ -z $argv[2] ]
        echo "Second argument must be a regex to search for"
        return 1
    end
    gpg --list-secret-keys | grep -q $argv[2] || return 1
    for file in (find $argv[1] -type f -name "*.gpg")
        if gpg --pinentry-mode cancel --list-packets $file 2>&1 | grep -q $argv[2]
            echo $file
        end
    end
end

