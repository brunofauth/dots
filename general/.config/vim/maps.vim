
let mapleader = '\'


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

" Mistypes
nnoremap <Leader>g zg
nnoremap <Leader>ug zug

onoremap ib :execute "keepjumps normal ggVG"<CR>

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

" Move lines up and down
nnoremap <C-J> <Cmd>execute 'move +' .. v:count1->string()<CR>
nnoremap <C-K> <Cmd>execute 'move -' .. string(v:count1 + 1)<CR>

" tabn/tabp in terminals which dont support pgup/pgdn
noremap <Leader><right> <Cmd>tabn<CR>
noremap <Leader><left>  <Cmd>tabp<CR>

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
nnoremap <S-F1> :help <C-R><C-W><CR>
vnoremap <S-F1> :help <C-R><C-W><CR>
nnoremap <F4> <Cmd>set list!<CR>
vnoremap <F4> <Cmd>set list!<CR>
inoremap <F4> <Cmd>set list!<CR>

" Quickfix control bindings
nnoremap <Leader>qq <Cmd>ToggleLocList<CR>
nnoremap <Leader>qt <Cmd>ToggleLocList<CR>
nnoremap <Leader>qc <Cmd>lclose<CR>
nnoremap <Leader>qo <Cmd>lopen<CR>

nnoremap <F5> <Cmd>source %<CR>
vnoremap <F5> <Cmd>source %<CR>
inoremap <F5> <Cmd>source %<CR>
nnoremap <S-F5> <Cmd>write<CR><Cmd>source %<CR>
vnoremap <S-F5> <Cmd>write<CR><Cmd>source %<CR>
inoremap <S-F5> <Cmd>write<CR><Cmd>source %<CR>

nnoremap <silent> <Leader>m <Cmd>vertical terminal ++close men<CR>
nnoremap <silent> <Leader>t <Cmd>vertical terminal ++close fish<CR>


" Take a Screenshot and insert, or not it's path
nnoremap <Leader>pp :call setreg('"', SaveScreenshot())<CR>P
nnoremap <Leader>PP :echo 'Saved' SaveScreenshot()<CR>
" Same as above, but use the contents of '"' instead of getcwd()
nnoremap <Leader>pr :call setreg('"', SaveScreenshot(getreg('"')))<CR>P
nnoremap <Leader>PR :call 'Saved' SaveScreenshot(getreg('"'))<CR>


" Capitalize last word
inoremap ;;c <ESC>B~Ela


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

nnoremap <Leader>gg :Goyo<CR>

let s:path = expand('<sfile>:p:h') . '/snippets'
augroup snippets
    autocmd!
    autocmd FileType markdown           exec 'source' s:path .. '/md.vim'
    autocmd FileType markdown.pandoc    exec 'source' s:path .. '/md.vim'
    autocmd FileType python             exec 'source' s:path .. '/py.vim'
    autocmd FileType cpp                exec 'source' s:path .. '/cpp.vim'
    autocmd FileType c                  exec 'source' s:path .. '/c.vim'
    autocmd FileType vim.abbr           exec 'source' s:path .. '/abbr.vim'
augroup END

