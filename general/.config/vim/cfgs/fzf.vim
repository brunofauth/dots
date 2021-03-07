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

" https://github.com/junegunn/fzf.vim/issues/772
" :h quotequote
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('"', join(lines, "\n"))}}

nnoremap <Plug>(fzf-maps-custom)r :Rg<CR>
nnoremap <Plug>(fzf-maps-custom)c :Colors<CR>
nnoremap <Plug>(fzf-maps-custom)f :Files<CR>
nnoremap <Plug>(fzf-maps-custom)F :GFiles<CR>
nnoremap <Plug>(fzf-maps-custom)b :Buffers<CR>
nnoremap <Plug>(fzf-maps-custom)w :Windows<CR>
cnoremap <Plug>(fzf-maps-custom)C :Commits<CR>
cnoremap <Plug>(fzf-maps-custom)t :Filetypes<CR>
nnoremap <Plug>(fzf-maps-custom)hf :History<CR>
nnoremap <Plug>(fzf-maps-custom)hc :History:<CR>
nnoremap <Plug>(fzf-maps-custom)hs :History/<CR>

