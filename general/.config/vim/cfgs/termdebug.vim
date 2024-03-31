" Mappings for :help termdebug
augroup termdebug_mappings
    autocmd!
    autocmd User TermdebugStartPre nnoremap <Leader>db <Cmd>Break<CR>
    autocmd User TermdebugStopPost nunmap <Leader>db
    autocmd User TermdebugStartPre nnoremap <Leader>dc <Cmd>Clear<CR>
    autocmd User TermdebugStopPost nunmap <Leader>dc
    autocmd User TermdebugStartPre nnoremap <Leader>dd <Cmd>Gdb<CR>
    autocmd User TermdebugStopPost nunmap <Leader>dd
    autocmd User TermdebugStartPre nnoremap <Leader>df <Cmd>Finish<CR>
    autocmd User TermdebugStopPost nunmap <Leader>df
    autocmd User TermdebugStartPre nnoremap <Leader>dg <Cmd>Continue<CR>
    autocmd User TermdebugStopPost nunmap <Leader>dg
    autocmd User TermdebugStartPre nnoremap <Leader>do <Cmd>Over<CR>
    autocmd User TermdebugStopPost nunmap <Leader>do
    autocmd User TermdebugStartPre nnoremap <Leader>dp <Cmd>Program<CR>
    autocmd User TermdebugStopPost nunmap <Leader>dp
    autocmd User TermdebugStartPre nnoremap <Leader>dr <Cmd>Run<CR>
    autocmd User TermdebugStopPost nunmap <Leader>dr
    autocmd User TermdebugStartPre nnoremap <Leader>ds <Cmd>Step<CR>
    autocmd User TermdebugStopPost nunmap <Leader>ds
augroup END

