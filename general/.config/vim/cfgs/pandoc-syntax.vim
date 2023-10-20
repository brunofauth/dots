" :help pandoc-syntax-configuration
" let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#conceal#use = 1

let g:pandoc#syntax#conceal#blacklist = [
    \ 'atx',
    \ 'list',
    \ 'titleblock',
    \ 'definition',
\ ]


augroup pandoc_syntax
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md setfiletype markdown.pandoc
augroup END

