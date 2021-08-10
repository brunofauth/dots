" There are also some VIM options (like completeopt and key defaults)
" which are automatically initialized, but you can skip this:
let g:jedi#auto_vim_configuration = 0

" You can make jedi-vim use tabs when going to a definition etc:
let g:jedi#use_tabs_not_buffers = 1

" Display function signatures in insert mode, highlighting the current
" argument. When set to "1", these signatures are displayed as a
" pop-up in the buffer and, when set to "2", as Vim's command line.
let g:jedi#show_call_signatures = "2"


let s:jedi_prefix = "<Leader>j"

let g:jedi#goto_command = s:jedi_prefix . "g"
let g:jedi#goto_assignments_command = s:jedi_prefix . "a"
let g:jedi#goto_stubs_command = s:jedi_prefix . "s"
let g:jedi#goto_definitions_command = s:jedi_prefix . "d"
let g:jedi#documentation_command = s:jedi_prefix . "k"
let g:jedi#usages_command = s:jedi_prefix . "u"
let g:jedi#completions_command = s:jedi_prefix . "c"
let g:jedi#rename_command = s:jedi_prefix . "r"


augroup jedi_completeopt
    autocmd!
    " This is done automatically when 'g:jedi#auto_vim_configuration = 1'
    autocmd FileType python setlocal completeopt=menuone,longest,preview
augroup END

