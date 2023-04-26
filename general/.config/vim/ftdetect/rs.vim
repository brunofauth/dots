augroup ftdetect_rs
    autocmd!
    autocmd BufRead,BufNewFile *.rs let g:termdebug_wide=1
    autocmd BufRead,BufNewFile *.rs let g:termdebugger = "rust-gdb"
augroup END

