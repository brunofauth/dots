function youtube-upload --description "youtube-upload with '--client-secrets' and '--credentials-file' set"
    command youtube-upload \
        --client-secrets $XDG_DATA_HOME/youtube-upload/client_secrets.json \
        --credentials-file $XDG_DATA_HOME/youtube-upload/credentials.json \
        $argv
end
