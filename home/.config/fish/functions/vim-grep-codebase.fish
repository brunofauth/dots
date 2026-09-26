function vim-grep-codebase --wraps=grep
    set fzf_preview_window "right,60%,border-left"
    set fzf_preview_window "$fzf_preview_window,<100(up,70%,border-bottom)"

    set preview_range_fst '$(set v (expr {2} - $FZF_PREVIEW_LINES / 2); test $v -ge 1 && echo $v)'
    set preview_range_lst '$(expr {2} + $FZF_PREVIEW_LINES / 2)'

    set    fzf_preview_cmd bat
    set -a fzf_preview_cmd --color=always
    set -a fzf_preview_cmd --number
    set -a fzf_preview_cmd --highlight-line={2}
    set -a fzf_preview_cmd --line-range=$preview_range_fst:$preview_range_lst
    set -a fzf_preview_cmd {1}

    set fzf_header "GREPing codebase"

    set fzf_bind_cmds \
        "esc:cancel" \
        "enter:execute(vim {1} +{2})+clear-selection" \
        "alt-enter:become(vim {1} +{2})" \
        "ctrl-x:exclude-multi"

    set fzf_footer "\
enter: edit the highlighted file inside this grep session
alt-enter: end this grep session and edit the highlighted file
ctrl-x: remove entries from listing"


    grep-codebase $argv \
        | fzf \
            --exact --ignore-case --select-1 --exit-0 \
            --header=$fzf_header --header-first \
            --footer=$fzf_footer \
            --delimiter=: --accept-nth=1 \
            --preview=(string join ' ' -- $fzf_preview_cmd) --preview-window=$fzf_preview_window \
            --bind=(string join ',' -- $fzf_bind_cmds) \
        | xargs -r --open-tty vim
end
