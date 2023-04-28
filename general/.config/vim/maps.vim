
let mapleader = '\'


const s:LINTER_COMMANDS = {
    \ 'vim': 'vint %s',
    \ 'sh': 'shellcheck --format=gcc --exclude=SC3043 %s',
\ }

function s:RunLinter()
    const l:cmd = FmtEscaped(s:LINTER_COMMANDS->get(&filetype, v:none), expand('%'))
    lexpr system(l:cmd) | lwindow
    call setloclist(0, [], 'a', {'title' : l:cmd})
endfunction
command RunLinter silent call s:RunLinter()

" Shorten REPL cycle duration.
nnoremap <silent> <Leader>cs :RunLinter<CR>
" nnoremap <Leader>cs :!cls && shellcheck %<CR>
nnoremap <Leader>cc :!cls && compileit %<CR>


" Write and backup; write as root.
nnoremap <Leader>w :call WriteAndBackUp()<CR>
nnoremap <Leader>W :w !sudo tee %<CR>


" Caret > Home; I don't want to press <S-6> every time
noremap <Home> ^
noremap <S-Home> <Home>

" J but upwards, and I don't use default K so.....
nnoremap gK K
nnoremap K kJ

" Move lines up and down
nnoremap <C-J> :move +1<CR>
nnoremap <C-K> :move -2<CR>

" tabn/tabp in terminals which dont support pgup/pgdn
nnoremap <Leader><right> :tabn<CR>
nnoremap <Leader><left>  :tabp<CR>

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
nnoremap <Leader>h :nohlsearch<CR>

" Quickfix control bindings
nnoremap <Leader>qq :ToggleLocList<CR>
nnoremap <Leader>qt :ToggleLocList<CR>
nnoremap <Leader>qc :lclose<CR>
nnoremap <Leader>qo :lopen<CR>


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
nnoremap cie <ESC>
" gqi as well
nnoremap gqi <ESC>


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

