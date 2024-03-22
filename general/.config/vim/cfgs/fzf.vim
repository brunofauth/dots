let g:fzf_layout = {
\    'up':'~90%',
\    'window': {
\        'width': 1,
\        'height': 0.8,
\        'yoffset':0.5,
\        'xoffset': 0.5,
\        'highlight': 'Todo',
\        'border': 'sharp'
\    }
\}
"\        'width': 0.95,


" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" :help fzf-vim-preview-window
" Note that this array is passed as arguments to fzf#vim#with_preview function
" man fzf
let g:fzf_preview_window = ['right,50%,~3', 'ctrl-/']

" Give the same prefix to the commands
let g:fzf_command_prefix = 'Fzf'

" https://github.com/junegunn/fzf.vim/issues/772
" :h quotequote
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-s': 'source',
  \ 'ctrl-y': {lines -> setreg('"', join(lines, "\n"))},
  \ }

nmap <Leader><tab> <Plug>(fzf-maps-n)
xmap <Leader><tab> <Plug>(fzf-maps-x)
omap <Leader><tab> <Plug>(fzf-maps-o)
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('find -mindepth 1 -maxdepth 1 -type d -printf "%%P/\n" , ! -type d -printf "%%P\n"')

nmap <Leader>f <Plug>(fzf-prefix)
nnoremap <Plug>(fzf-prefix)l  <Cmd>FzfBLines<CR>
nnoremap <Plug>(fzf-prefix)L  :FzfLocate 
nnoremap <Plug>(fzf-prefix)r  <Cmd>FzfRg<CR>
nnoremap <Plug>(fzf-prefix)R  :FzfRg <C-R><C-A><CR>
nnoremap <Plug>(fzf-prefix)c  <Cmd>FzfCommands<CR>
nnoremap <Plug>(fzf-prefix)f  <Cmd>FzfFiles<CR>
nnoremap <Plug>(fzf-prefix)F  <Cmd>execute "FzfFiles" g:vimrc_home_dir<CR>
nnoremap <Plug>(fzf-prefix)g  <Cmd>FzfGFiles<CR>
nnoremap <Plug>(fzf-prefix)b  <Cmd>FzfBuffers<CR>
nnoremap <Plug>(fzf-prefix)w  <Cmd>FzfWindows<CR>
nnoremap <Plug>(fzf-prefix)C  <Cmd>FzfColors<CR>
nnoremap <Plug>(fzf-prefix)t  <Cmd>FzfFiletypes<CR>
nnoremap <Plug>(fzf-prefix)h  <Cmd>FzfHelptags<CR>
nnoremap <Plug>(fzf-prefix)Hf <Cmd>FzfHistory<CR>
nnoremap <Plug>(fzf-prefix)Hc <Cmd>FzfHistory:<CR>
nnoremap <Plug>(fzf-prefix)Hs <Cmd>FzfHistory/<CR>

nnoremap <A-Tab> <Cmd>FzfSnippets<CR>
inoremap <A-Tab> <Cmd>FzfSnippets<CR>

