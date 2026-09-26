function vim-find-codebase --wraps=find
    set fzf_preview_window "right,60%,border-left"
    set fzf_preview_window "$fzf_preview_window,<100(up,70%,border-bottom)"

    set    fzf_preview_cmd bat
    set -a fzf_preview_cmd --color=always
    set -a fzf_preview_cmd --number
    set -a fzf_preview_cmd {1}

    set fzf_header "FINDing codebase"

    set fzf_bind_cmds \
        "esc:cancel" \
        "ctrl-g:execute(fish -c \"vim-grep-codebase . {1}\")" \
        "enter:execute(vim {1})+clear-selection" \
        "alt-enter:become(vim {1})" \
        "ctrl-x:exclude-multi"

    set fzf_footer "\
ctrl-g: grep lines from the highlighted file
enter: edit the highlighted file inside this find session
enter: end this find session and edit the highlighted file
ctrl-x: remove entries from listing"

    find-codebase $argv \
        | fzf \
            --exact --ignore-case --select-1 --exit-0 \
            --header=$fzf_header --header-first \
            --footer=$fzf_footer \
            --preview=(string join ' ' -- $fzf_preview_cmd) --preview-window=$fzf_preview_window \
            --bind=(string join ',' -- $fzf_bind_cmds) \
        | xargs -r --open-tty vim
end
