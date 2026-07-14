function vim-grep-codebase --wraps=grep
    set fzf_preview_window "right,60%,border-left"
    set fzf_preview_window "$fzf_preview_window,<100(up,70%,border-bottom)"
    set fzf_preview_cmd    'bat --color=always --number --highlight-line {2} {1}'

    set fzf_bind_cmds \
        "esc:cancel" \
        "enter:execute(vim {1} +{2})+clear-selection" \
        "alt-enter:become(vim {1} +{2})+clear-selection"

    grep-codebase $argv \
        | fzf \
            --exact --ignore-case --select-1 --exit-0 \
            --delimiter=: --accept-nth=1 \
            --preview=$fzf_preview_cmd --preview-window=$fzf_preview_window \
            --bind=(string join ',' $fzf_bind_cmds) \
        | xargs -r --open-tty vim
end
