
const s:LINTER_COMMANDS = {
    \ 'vim': 'vint %s',
    \ 'sh': 'shellcheck --format=gcc --exclude=SC3043 %s',
\ }

nnoremap Q <Nop>
nnoremap <C-End> <Nop>
nnoremap <C-Home> <Nop>
inoremap <C-End> <Nop>
inoremap <C-Home> <Nop>
vnoremap <C-End> <Nop>
vnoremap <C-Home> <Nop>

" Whole Buffer text object
onoremap ib <Cmd>keepjumps normal ggVG<CR>
vnoremap ib <Cmd>keepjumps normal ggVG<CR>

nnoremap ]<Space> o<Esc>k<End>
nnoremap [<Space> O<Esc>j<End>

nnoremap ]<Enter> o<Esc>j<End>
nnoremap [<Enter> O<Esc>k<End>

nnoremap dD "_dd

function s:RunLinter()
    const l:cmd = FmtEscaped(s:LINTER_COMMANDS->get(&filetype, v:none), expand('%'))
    lexpr system(l:cmd) | lwindow
    call setloclist(0, [], 'a', {'title' : l:cmd})
endfunction
command RunLinter silent call s:RunLinter()

" Shorten REPL cycle duration.
noremap <silent> <Leader>cs <Cmd>RunLinter<CR>
noremap <silent> <Leader>cc <Cmd>!cls && compileit %<CR>

inoremap <Leader><Up> ↑
inoremap <Leader><Down> ↓
inoremap <Leader><Left> ←
inoremap <Leader><Right> →

" Write and backup; write as root.
noremap <Leader>w <Cmd>call WriteAndBackUp()<CR>
noremap <Leader>W <Cmd>w !sudo tee %<CR>


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

" Yanks the whole buffer to '+'
nnoremap <Leader>ya ggVG"+y<C-o><C-o>
" Copies '+' register into system clipboard
nnoremap <Leader>yc :call WriteToClipboard(getreg('+'))<CR>
" Copies te whole buffer to '+' and then copies it into the system's clipboard
nmap <Leader>yC yayc


" Substitutes inner word/WORD by yanked text.
nnoremap <Leader>cw ciw<C-r>0<ESC>
nnoremap <Leader>cW ciW<C-r>0<ESC>


" Turns off search match highlighting
nnoremap <Leader>h <Cmd>set hlsearch!<CR>
" Close help window
nnoremap <F1> <Cmd>helpclose<CR>
vnoremap <F1> <Cmd>helpclose<CR>
inoremap <F1> <Cmd>helpclose<CR>
nnoremap <S-F1> <Cmd>execute (winwidth(0) > 120? 'vertical': '') "help <cword>"<CR>
vnoremap <S-F1> <Cmd>execute (winwidth(0) > 120? 'vertical': '') "help <cword>"<CR>
nnoremap <F4> <Cmd>set list!<CR>
vnoremap <F4> <Cmd>set list!<CR>
inoremap <F4> <Cmd>set list!<CR>

" Quickfix control bindings
nnoremap <Leader>qq <Cmd>ToggleLocList<CR>
nnoremap <Leader>qc <Cmd>lclose<CR>
nnoremap <Leader>qo <Cmd>lopen<CR>

nnoremap <S-F5> <Cmd>write<CR><Cmd>source %<CR>
vnoremap <S-F5> <Cmd>write<CR><Cmd>source %<CR>
inoremap <S-F5> <Cmd>write<CR><Cmd>source %<CR>

nnoremap <silent> <Leader>m <Cmd>vertical terminal ++close men<CR>
nnoremap <silent> <Leader>M <Cmd>Man <cfile><C-W><CR>
nnoremap <silent> <Leader>t <Cmd>vertical terminal ++close fish<CR>


" Take a Screenshot and insert, or not it's path
nnoremap <Leader>pp :call setreg('"', SaveScreenshot())<CR>P
nnoremap <Leader>PP :echo 'Saved' SaveScreenshot()<CR>
" Same as above, but use the contents of '"' instead of getcwd()
nnoremap <Leader>pr :call setreg('"', SaveScreenshot(getreg('"')))<CR>P
nnoremap <Leader>PR :call 'Saved' SaveScreenshot(getreg('"'))<CR>


" For some reason, when I accidentally type 'cie', vim hangs and I lose
" everything, so I might as well just map it to something harmless.
nnoremap cie <Nop>
" gqi as well
nnoremap gqi <Nop>


" Mappings for :help termdebug
nnoremap <Leader>dt :Termdebug<CR>
nnoremap <Leader>db :Break<CR>
nnoremap <Leader>dg :Continue<CR>
nnoremap <Leader>df :Finish<CR>
nnoremap <Leader>dc :Clear<CR>
nnoremap <Leader>do :Over<CR>
nnoremap <Leader>ds :Step<CR>
nnoremap <Leader>dr :Run<CR>
nnoremap <Leader>dd :Gdb<CR>
nnoremap <Leader>dp :Program<CR>

