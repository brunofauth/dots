let g:fzf_layout = {
\    'up':'~90%',
\    'window': {
\        'width': 0.8,
\        'height': 0.8,
\        'yoffset':0.5,
\        'xoffset': 0.5,
\        'highlight': 'Todo',
\        'border': 'sharp'
\    }
\}


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

nnoremap <Plug>(fzf-prefix)r :FzfRg<CR>
nnoremap <Plug>(fzf-prefix)c :FzfColors<CR>
nnoremap <Plug>(fzf-prefix)f :FzfFiles<CR>
nnoremap <Plug>(fzf-prefix)F :FzfGFiles<CR>
nnoremap <Plug>(fzf-prefix)b :FzfBuffers<CR>
nnoremap <Plug>(fzf-prefix)w :FzfWindows<CR>
nnoremap <Plug>(fzf-prefix)C :FzfCommits<CR>
nnoremap <Plug>(fzf-prefix)t :FzfFiletypes<CR>
nnoremap <Plug>(fzf-prefix)hf :FzfHistory<CR>
nnoremap <Plug>(fzf-prefix)hc :FzfHistory:<CR>
nnoremap <Plug>(fzf-prefix)hs :FzfHistory/<CR>

