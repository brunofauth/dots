function bak --description "Copies files and adds a '.bak' suffix to them"
    for file in $argv
        cp $file (dirname $file)/.(basename $file).bak
    end
end

