set fzf_keybindings "esc:cancel"
set fzf_header

function _add_key_binding
    set -l key $argv[1]
    set -l cmd $argv[2]
    set -l msg $argv[3]
    set fzf_keybindings $fzf_keybindings,$key:$cmd
    set -a fzf_header "$key: $msg"
end

set cmd_run_editor '
    func_path="$(fish -ic "functions --details {}")"
    case "$func_path" in
        -) echo "Can not edit sourced function";;
        n/a) echo "That is not a function";;
        *) "$EDITOR" "$func_path";;
    esac
'

_add_key_binding \
    "ctrl-e" \
    "execute($cmd_run_editor)" \
    "edit function definition"

set fzf_preview_cmd 'fish -ic "functions {}" | bat --color=always --language=fish --plain'
set fzf_preview_window "right,60%,border-left,~1"
set fzf_preview_window $fzf_preview_window,"<100(up,50%,border-bottom)"

function fn
    functions --names | fzf -e -i --ansi \
        --prompt="Fish function: " --header=$fzf_header --header-first \
        --preview=$fzf_preview_cmd --preview-window=$fzf_preview_window \
        --bind=$fzf_keybindings
end

