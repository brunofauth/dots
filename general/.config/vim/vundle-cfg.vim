" be iMproved, required
set nocompatible 

inoremap a b
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.local/share/vim/bundle/Vundle.vim


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'https://github.com/ycm-core/YouCompleteMe'


call vundle#end()

filetype plugin indent on

