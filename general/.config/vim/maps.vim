
let mapleader = "\\"


" Shorten REPL cycle duration.
nnoremap <Leader>s :!cls && shellcheck %<CR>
nnoremap <Leader>c :!cls && compileit %<CR>


" Write and backup; write as root.
nnoremap <Leader>w :call WriteAndBackUp()<CR>
nnoremap <Leader>W :w !sudo tee %<CR>


" Yanks the whole buffer to '+'
nnoremap <Leader>ya ggVG"+y<C-o><C-o>
" Copies '+' register into system clipboard
nnoremap <Leader>yc :call WriteToClipboard(getreg('+'))<CR>


" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
execute "set <A-c>=\ec"
execute "set <A-v>=\ev"
" Allows coping and pasting to and from '+' with 'alt'
vnoremap <A-c> "+y
noremap <A-v> "+p


" Turns off search match highlighting
nnoremap <Leader>h :nohlsearch<CR>


" Capitalize last word
inoremap ;;c <ESC>B~Ea


" For some reason, when I accidentally type 'cie', vim hangs and I lose
" everything, so I might as well just map it to something harmless.
nnoremap cie <ESC>


" Mappings for 'https://github.com/junegunn/fzf.vim'.
" See './fzf-vim-cfg.vim'
nnoremap <Leader>f <Plug>(fzf-maps-custom)
nnoremap <Leader><tab> <Plug>(fzf-maps-n)
xnoremap <Leader><tab> <Plug>(fzf-maps-x)
onoremap <Leader><tab> <Plug>(fzf-maps-o)


" Mappings for :help termdebug
nnoremap <Leader>db :Break<CR>
nnoremap <Leader>dg :Continue<CR>
nnoremap <Leader>df :Finish<CR>
nnoremap <Leader>dc :Clear<CR>
nnoremap <Leader>do :Over<CR>
nnoremap <Leader>ds :Step<CR>
nnoremap <Leader>dr :Run<CR>
nnoremap <Leader>dd :Gdb<CR>
nnoremap <Leader>dp :Program<CR>

