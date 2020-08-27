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


nnoremap <Leader>b :Buffers<CR>

