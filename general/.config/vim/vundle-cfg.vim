filetype off


const s:BUNDLE_INSTALL_DIR = $XDG_DATA_HOME . '/vim/bundle/'

" set the runtime path to include Vundle and initialize
let &rtp.=',' . s:BUNDLE_INSTALL_DIR . 'Vundle.vim/'


call vundle#begin(s:BUNDLE_INSTALL_DIR)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Fish syntax highlighting
Plugin 'dag/vim-fish'

" Looking cute, might test it later
" Plugin 'neoclide/coc.nvim'

" python 'intellisense'
Plugin 'davidhalter/jedi-vim'

" Manage tags, quotes, brackets...
Plugin 'tpope/vim-surround'

" Text objects and motions for Latex editing
Plugin 'gibiansky/vim-latex-objects'

call vundle#end()


filetype plugin indent on

