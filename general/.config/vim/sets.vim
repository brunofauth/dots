" Turns on syntax highlighting, without
" overriding user defined syntax
syntax enable

" Enables filetype inference, as well as loading
" plugins for each filetype
filetype plugin on
" filetype plugin indent on

" Displays numbers on the left side of each line
set number relativenumber

" Highlights and seraches for words while typing
set hlsearch incsearch
" smart case sensitivity when searching
set smartcase

" Use \n for new lines, instead of \r or \r\n
set fileformat=unix

" Places new windows below and to the right with :sp and :vs
set splitbelow splitright

" Shows a snippet of the last run command at the bottom of the screen
set showcmd
" Always show window status bars
set laststatus=2

" Insert and delete 4 spaces instead of a <Tab>
set smarttab
set shiftwidth=4
set expandtab

" Enable folding indented code. Only start doing it
" automatically after 99 indentations, though.
set foldmethod=indent
set foldlevel=99
" set foldclose=all

" Indent wrapped ((curr indent + 1) AKA 4 spaces)
set breakindent
set breakindentopt=shift:4,min:40
" set breakindentopt=shift:2,min:40,sbr
" set showbreak=>>

" Disables annoying ding everywhere
set belloff=all

" Enables backspacing through lines and over autoindent
set backspace=indent,eol,start
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$

" Leaves three lines as context above and below the cursor
set scrolloff=3

" Disable considering number starting with a 0 as octal when inc/dec
set nrformats-=octal

" Enable better glob completion
set wildmode=longest,full
set wildmenu

" remove a comment leader when joining lines
set formatoptions+=j

" Enables opening up to this number of new tabs
set tabpagemax=50

" Saving options in session and view files causes problems
set sessionoptions-=options
set viewoptions-=options

" Show as much as possible of the last line in a window, putting "@@@" in the
" end of that line fragment, to denote that this line hasn't ended yet.
set display=lastline
" Show unprintable characters hexadecimal as <xx> instead of using ^C and ~C.
set display+=uhex

let g:med_dir = $HOME . '/notes/med5/'

" " This allows me to use 'fish' with ':sh' while having '$SHELL' set to '/bin/sh'
set shell=/bin/sh

" Disable a legacy behavior that can break plugin maps.
if has('langmap') && exists('+langremap') && &langremap
    set nolangremap
endif

set background=dark

set timeoutlen=500

highlight Pmenu ctermfg=White guifg=White
highlight Pmenu ctermbg=Black guibg=Black

