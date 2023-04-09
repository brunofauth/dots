function meet
    function inner
        set -f PATTERN '^([[:alpha:]]{3})-?([[:alpha:]]{4})-?([[:alpha:]]{3})$' 
        set -f REPLACE 'https://meet.google.com/$1-$2-$3' 

        while true
            read -P "Videoconference code: " code
            string replace -r $PATTERN $REPLACE $code && break
        end
    end
    inner | xargs -r xdg-open
end

