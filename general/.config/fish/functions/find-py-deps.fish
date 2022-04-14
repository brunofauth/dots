function find-py-deps --description "Print all dependencies in the given python files"

    for file in $argv
        grep -e '^import' -e '^from' $file
    end | cut -d ' ' -f2 | cut -d '.' -f1 | sort | uniq

end
