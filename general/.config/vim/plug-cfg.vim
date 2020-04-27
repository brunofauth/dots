let s:PLUG_URL = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:PLUG_INSTALL_DIR = $XDG_DATA_HOME . '/vim/plugged/'
let s:PLUG_FILE = s:PLUG_INSTALL_DIR . 'plug.vim'

if !filereadable(s:PLUG_FILE)
    echo '"plug.vim" not found. Downloading...'
    execute '!curl -fLo ' . s:PLUG_FILE . ' --create-dirs ' . s:PLUG_URL
endif

execute 'source ' . s:PLUG_FILE


call plug#begin(s:PLUG_INSTALL_DIR)

" Fish syntax highlighting
Plug 'dag/vim-fish'

" Looking cute, might test it later
" Plug 'neoclide/coc.nvim'

" python 'intellisense'
Plug 'davidhalter/jedi-vim'

" Manage tags, quotes, brackets...
Plug 'tpope/vim-surround'

" Text objects and motions for Latex editing
Plug 'gibiansky/vim-latex-objects'

call plug#end()

