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

" Code formatting
Plug 'psf/black'
let g:black_linelength = 120

" Manage tags, quotes, brackets...
Plug 'https://github.com/tpope/vim-surround.git'
runtime cfgs/surround.vim

" Text objects and motions for Latex editing
Plug 'gibiansky/vim-latex-objects'

" Vim sugar for the UNIX shell commands that need it the most
Plug 'https://github.com/tpope/vim-eunuch.git'

" Things you can do with fzf and Vim.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
runtime cfgs/fzf.vim

" Toggle fullscreen for vim windows, useful when using splits
Plug 'https://github.com/vim-scripts/ZoomWin'

" Allows you to use <Tab> for insert completion (:h ins-completion).
Plug 'https://github.com/ervandew/supertab'

" This plugin uses clang for accurately completing C and C++ code.
Plug 'https://github.com/xavierd/clang_complete'
let g:clang_library_path='/usr/lib/'

" HTML, CSS abbreviations
Plug 'https://github.com/mattn/emmet-vim/'
runtime cfgs/emmet.vim

" Support for all of Pandoc's markdown syntax features
Plug 'vim-pandoc/vim-pandoc-syntax'
runtime cfgs/pandoc-syntax.vim

" " Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
" Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
runtime cfgs/vim-markdown.vim

" Reading mode
Plug 'https://github.com/junegunn/goyo.vim'

" indent, highlight syntax and detect sxhkd config files
Plug 'kovetskiy/sxhkd-vim'

" syntax highlighting and filetype detection for RON
Plug 'ron-rs/ron.vim'

" Async Language Server Protocol plugin for vim8 and neovim.
Plug 'prabirshrestha/vim-lsp'
runtime cfgs/vim-lsp.vim

" View and search LSP symbols, tags in Vim/NeoVim.
Plug 'liuchengxu/vista.vim'
runtime cfgs/vista.vim

" Plug 'https://github.com/tpope/vim-repeat'

call plug#end()

