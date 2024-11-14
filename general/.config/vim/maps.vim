" vim: foldmethod=marker foldlevel=1 foldclose=all
const s:LINTER_COMMANDS = {
    \ 'vim': 'vint %s',
    \ 'sh': 'shellcheck --format=gcc --exclude=SC3043 %s',
\ }


" -------- set undesired mappings to <Nop> {{{
nnoremap Q <Nop>
nnoremap <C-End> <Nop>
inoremap <C-End> <Nop>
vnoremap <C-End> <Nop>
nnoremap <C-Home> <Nop>
inoremap <C-Home> <Nop>
vnoremap <C-Home> <Nop>
nnoremap <Up> <Nop>
vnoremap <Up> <Nop>
nnoremap <Down> <Nop>
vnoremap <Down> <Nop>
nnoremap <Left> <Nop>
vnoremap <Left> <Nop>
nnoremap <Right> <Nop>
vnoremap <Right> <Nop>

" For some reason, when I accidentally type 'cie' or 'gqi', vim hangs, so I
" remapped it to something harmless.
nnoremap cie <Nop>
nnoremap gqi <Nop>
" }}}


" Whole Buffer text object
onoremap ib <Cmd>keepjumps normal ggVG<CR>
vnoremap ib <Cmd>keepjumps normal ggVG<CR>

nnoremap ]<Space> o<Esc>k<End>
nnoremap [<Space> O<Esc>j<End>

nnoremap ]<Enter> o<Esc>j<End>
nnoremap [<Enter> O<Esc>k<End>

nnoremap dD "_dd
nnoremap cC "_cc

function s:RunLinter()
    const l:cmd = FmtEscaped(s:LINTER_COMMANDS->get(&filetype, v:none), expand('%'))
    lexpr system(l:cmd) | lwindow
    call setloclist(0, [], 'a', {'title' : l:cmd})
endfunction
command RunLinter silent call s:RunLinter()

" Shorten REPL cycle duration.
noremap <silent> <Leader>cs <Cmd>RunLinter<CR>
noremap <silent> <Leader>cc <Cmd>!cls && compileit %<CR>


" -------- Insert mode Unicode characters {{{
" These are 'deprecated' in favor of digraphs (:help *digraph-table-mbyte*)
inoremap <F1>h ←
inoremap <F1>j ↓
inoremap <F1>k ↑
inoremap <F1>l →
inoremap <F1>m ♂
inoremap <F1>f ♀
inoremap <F1>- ⊖
inoremap <F1>= ⊕
" }}}


" Caret > Home; I don't want to press <S-6> every time
noremap <Home> ^
noremap <S-Home> <Home>

" J but upwards, and I don't use default K so.....
nnoremap gK K
nnoremap K kJ

" Open the filename under the cursor with xdg-open
nnoremap go <Cmd>silent !nohup xdg-open <cfile> > /dev/null 2>&1 &<CR><Cmd>redraw!<CR>

" Move lines up and down
nnoremap <C-J> <Cmd>execute 'move +' .. v:count1->string()<CR>
nnoremap <C-K> <Cmd>execute 'move -' .. string(v:count1 + 1)<CR>


" Substitutes inner word/WORD by yanked text.
nnoremap <Leader>cw ciw<C-r>0<ESC>
nnoremap <Leader>cW ciW<C-r>0<ESC>


" Turns off search match highlighting
nnoremap <Leader>h <Cmd>set hlsearch! hlsearch?<CR>
nnoremap <Leader>p <Cmd>set paste! paste?<CR>
nnoremap <F4>      <Cmd>set list! list?<CR>

" Close help window
 noremap <F1> <Cmd>helpclose<CR>
inoremap <F1> <Cmd>helpclose<CR>
 noremap <S-F1> <Cmd>execute (winwidth(0) > 120? 'vertical': '') "help" expand("<cword>")<CR>


" -------- Quickfix and Location List {{{
nnoremap <Leader>q <Cmd>ToggleLocList<CR>
nnoremap <Leader>w <Cmd>ToggleQuickFix<CR>
nnoremap ]l <Cmd>lnext<CR>
nnoremap [l <Cmd>lprev<CR>
nnoremap ]c <Cmd>cnext<CR>
nnoremap [c <Cmd>cprev<CR>
" }}}


 noremap <S-F5> <Cmd>write<CR><Cmd>source %<CR>
inoremap <S-F5> <Cmd>write<CR><Cmd>source %<CR>

nnoremap <silent> <Leader>m <Cmd>vertical terminal ++close men<CR>
nnoremap <silent> <Leader>t <Cmd>vertical terminal ++close fish<CR>

