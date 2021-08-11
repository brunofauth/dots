" :help pandoc-syntax-configuration
let g:pandoc#syntax#conceal#use = 0


augroup pandoc_syntax
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md setfiletype markdown.pandoc
augroup END

