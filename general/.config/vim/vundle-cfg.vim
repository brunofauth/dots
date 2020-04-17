" be iMproved, required
set nocompatible 

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.local/share/vim/bundle/Vundle.vim


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin($XDG_CONFIG_HOME . '/vim/bundle/')

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


call vundle#end()

filetype plugin indent on

