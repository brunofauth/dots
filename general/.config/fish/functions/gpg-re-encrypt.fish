function gpg-re-encrypt
    if [ -z $argv[1] ] || ! [ -f argv[1] ]
        echo "First argument must point to a file"
        return 1
    end
    if [ -z $argv[1] ]
        echo "Second argument must be a regex to match against"
        return 1
    end
    gpg --list-secret-keys | grep -q $argv[2] || exit 1
    set tmpfile (mktemp gpg-re-encrypt.XXXXXXXXXX --tmpdir)
    gpg --decrypt $argv[1] | gpg --yes --encrypt --recipient $argv[2] --output $tmpfile
    mv --force $tmpfile $argv[1]
end

