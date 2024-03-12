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

set termguicolors
highlight Pmenu ctermfg=White guifg=White
highlight Pmenu ctermbg=Black guibg=Black

highlight PmenuSel term=bold cterm=bold gui=bold
highlight PmenuSel ctermfg=242 guifg=Black
highlight PmenuSel ctermbg=0 guibg=DarkGrey

highlight QuickFixLine ctermfg=White guifg=White
highlight QuickFixLine ctermbg=Blue guibg=Blue

highlight Search term=reverse ctermfg=0 guifg=Black
highlight Search term=reverse ctermbg=11 guibg=DarkYellow

highlight WildMenu term=reverse ctermfg=0 guifg=Black
highlight WildMenu term=reverse ctermbg=11 guibg=DarkYellow

highlight Todo term=reverse ctermfg=0 guifg=Black
highlight Todo term=reverse ctermbg=11 guibg=DarkYellow

highlight StatusLine term=bold,reverse cterm=bold gui=bold
highlight StatusLine ctermfg=Black guifg=White
highlight StatusLine ctermbg=DarkGray guibg=#121212

highlight StatusLineNC term=reverse cterm=NONE gui=NONE
highlight StatusLineNC ctermfg=black guifg=White
highlight StatusLineNC ctermbg=Gray guibg=#424242

highlight VertSplit term=reverse cterm=NONE gui=NONE guibg=Black

highlight SignColumn term=standout
highlight SignColumn ctermfg=White guifg=White
highlight SignColumn ctermbg=Gray guibg=#424242

highlight TabLine term=underline cterm=underline gui=underline 
highlight TabLine ctermfg=White guifg=White
highlight TabLine ctermbg=Gray guibg=#424242

highlight TabLineSel term=bold cterm=bold gui=bold
highlight TabLineSel ctermfg=Black guifg=White
highlight TabLineSel ctermbg=DarkGray guibg=#121212

highlight TabLineFill term=reverse cterm=NONE gui=NONE
highlight TabLineFill ctermfg=White guifg=White
highlight TabLineFill ctermbg=Gray guibg=#424242

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set sessionoptions=

" hidden and unloaded buffers, not just those in windows
set sessionoptions+=buffers

" manually created folds, opened/closed folds and local fold options
set sessionoptions+=folds

" " the help window
" set sessionoptions+=help

" sessionfile's parent dir becomes the cwd
set sessionoptions+=sesdir

" all tab pages; without this only the current tab page is restored,
" so that you can make a session for each tab page separately
set sessionoptions+=tabpages

" " include terminal windows where the command can be restored
" set sessionoptions+=terminal

" global variables that start with an uppercase letter and contain at least
" one lowercase letter. Only String and Number types are stored.
set sessionoptions+=globals

" options and mappings local to a window or buffer (not global values for local options)
set sessionoptions+=localoptions

" all options and mappings (also global values for local options)
set sessionoptions+=options

