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

" Give the same prefix to the commands
let g:fzf_command_prefix = 'Fzf'

" https://github.com/junegunn/fzf.vim/issues/772
" :h quotequote
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
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
nnoremap <Plug>(fzf-prefix)l :FzfLines<CR>
nnoremap <Plug>(fzf-prefix)L :FzfLocate
nnoremap <Plug>(fzf-prefix)r :FzfRg<CR>
nnoremap <Plug>(fzf-prefix)c :FzfCommands<CR>
nnoremap <Plug>(fzf-prefix)f :FzfFiles<CR>
nnoremap <Plug>(fzf-prefix)F :FzfGFiles<CR>
nnoremap <Plug>(fzf-prefix)b :FzfBuffers<CR>
nnoremap <Plug>(fzf-prefix)w :FzfWindows<CR>
nnoremap <Plug>(fzf-prefix)C :FzfColors<CR>
nnoremap <Plug>(fzf-prefix)t :FzfFiletypes<CR>
nnoremap <Plug>(fzf-prefix)h :FzfHelptags<CR>
nnoremap <Plug>(fzf-prefix)Hf :FzfHistory<CR>
nnoremap <Plug>(fzf-prefix)Hc :FzfHistory:<CR>
nnoremap <Plug>(fzf-prefix)Hs :FzfHistory/<CR>

