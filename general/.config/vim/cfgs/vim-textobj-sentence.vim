vim9script

augroup textobj_sentence
    autocmd!
    autocmd FileType asciidoc,markdown,text,flashcard call textobj#sentence#init()
augroup END
