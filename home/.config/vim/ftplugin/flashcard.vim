vim9script

if exists("b:did_ftplugin_flashcard")
  finish
endif
b:did_ftplugin_flashcard = 1


setlocal autoindent


def CopyTagsFromPrevCard(): void
    keeppatterns normal ?tags {<CR>jyi{N$"_di{kp/}<CR>k<Cmd>noh<CR>cc
    # nohlsearch
    # normal cc
enddef


nmap <buffer> <silent> <Leader>t ?tags {<CR>jyi{N$"_di{kp/}<CR>k<Cmd>noh<CR>cc
# nmap <buffer> <silent> <Leader>t <ScriptCmd>CopyTagsFromPrevCard()<CR>
nmap <buffer> <silent> <Leader>d ?card {<CR>$va}o0y/^}<CR>o<Esc>o<Esc>p<Cmd>noh<CR>jjf:llC
# nmap <buffer> <silent> <Leader>d :exe ":keepp norm ?card {<CR>$va}o0y/^}<CR>o<Esc>o<Esc>p<Cmd>noh<CR>jjf:llC"<CR>

inoremap <buffer> ~ <Esc>/answer {<CR><Cmd>noh<CR>$di{O<Tab>
inoremap <buffer> =- ±
inoremap <buffer> .= ≥
inoremap <buffer> ,= ≤

setlocal commentstring=//%s

