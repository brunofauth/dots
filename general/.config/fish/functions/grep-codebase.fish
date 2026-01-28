function grep-codebase --wraps=grep
    grep \
        --recursive --ignore-case --perl-regexp \
        --line-number --with-filename \
        --binary-files=without-match \
        --exclude-dir .git \
        --exclude-dir .cache \
        --exclude-dir node_modules \
        $argv
end
