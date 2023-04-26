nnoremap <Leader>vv :Vista!!<CR>
nnoremap <Leader>vs :Vista show<CR>
nnoremap <Leader>vf :Vista finder fzf:vim_lsp<CR>
let g:vista_update_on_text_changed = 1
let g:vista_default_executive = 'vim_lsp'

function s:RefreshVistaSidebar()
    if vista#sidebar#IsOpen()
        call vista#sidebar#Close()
        call vista#sidebar#Open()
    endif
endfunction

augroup vista_cfg
    autocmd!
    autocmd BufWinEnter * call s:RefreshVistaSidebar()
augroup END

