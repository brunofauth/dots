function note

    set semester 8
    set subject $argv[1]
    set dst_dir $HOME/newmed/notas/$semester/$subject
    if test -z $subject || ! test -d $dst_dir
        echo 'Missing or invalid "SUBJECT" entry ($argv[1])'
        exit 1
    end
    cd $dst_dir || exit 1
    
    if test -z $argv[2]
        echo 'Missing filename ($argv[2])'
        exit 1
    end
    set fname $argv[2].md

    set editor $EDITOR
    if test -z $editor
        set editor vim
    end

    exec $editor $fname
end

