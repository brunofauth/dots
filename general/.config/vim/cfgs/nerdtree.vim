" set vim's CWD whenever nerdtree's root changes; for each tab
let g:NERDTreeChDirMode = 3

let g:NERDTreeBookmarksFile = $XDG_DATA_HOME .. "nerdtree/bookmarks"
let g:NERDTreeQuitOnOpen = 0

nnoremap <leader>n <Cmd>NERDTreeToggle<CR>
nnoremap <leader>N <Cmd>NERDTreeFind<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

augroup nerdtree_config
    autocmd!

    " " Start NERDTree. If a file is specified, move the cursor to its window.
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

augroup END
