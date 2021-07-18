inoremap <buffer> --> &rarr;
inoremap <buffer> <-- &larr;
inoremap <buffer> <= &le;
inoremap <buffer> >= &ge;
inoremap <buffer> != &ne;

setlocal autoindent
" setlocal textwidth=79

inoremap <buffer> ;a á
inoremap <buffer> ;e é
inoremap <buffer> ;i í
inoremap <buffer> ;o ó
inoremap <buffer> ;u ú
inoremap <buffer> ;c ç

" :help map-modes
noremap <buffer> <Up> gk
noremap <buffer> <Down> gj

if expand('%:p:h') =~? '/notes/med' "('^' . $med_dir)
    " If the names of the files have '?' or other chars, this fails
    let &l:dictionary = tr(glob(g:med_dir . '**/*.md'), "\n", ',')
    setlocal complete+=k
endif

