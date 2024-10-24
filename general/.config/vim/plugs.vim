" vim: foldmethod=marker foldlevel=0
" packadd termdebug
runtime cfgs/termdebug.vim

packadd cfilter


" Automatically download and install vim-plug if not found {{{

let s:PLUG_URL = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:PLUG_INSTALL_DIR = $XDG_DATA_HOME . '/vim/plugged/'
let s:PLUG_FILE = s:PLUG_INSTALL_DIR . 'plug.vim'

if !filereadable(s:PLUG_FILE)
    echo '"plug.vim" not found. Downloading...'
    execute '!curl -fLo ' . s:PLUG_FILE . ' --create-dirs ' . s:PLUG_URL
endif

execute 'source ' . s:PLUG_FILE

" }}}


call plug#begin(s:PLUG_INSTALL_DIR)


" SYNTAX HIGHLIGHTING {{{

" Fish syntax highlighting
Plug 'dag/vim-fish'

" Support for all of Pandoc's markdown syntax features
Plug 'vim-pandoc/vim-pandoc-syntax'
runtime cfgs/pandoc-syntax.vim

" " Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
Plug '~/cln/vim-markdown-ext/'
runtime cfgs/vim-markdown.vim

" indent, highlight syntax and detect sxhkd config files
Plug 'kovetskiy/sxhkd-vim'

" syntax highlighting and filetype detection for RON
Plug 'ron-rs/ron.vim'

Plug 'leafOfTree/vim-svelte-plugin'
runtime cfgs/vim-svelte.vim

" OBS: Work In Progress
Plug 'https://github.com/kaarmu/typst.vim'

" Add syntax highlighting support for mbsync config file
Plug 'https://github.com/Fymyte/mbsync.vim'

" }}}


" TEXT-EDITING AIDS/FEATURES {{{


" vim-surround {{{
Plug 'https://github.com/tpope/vim-surround.git'
let g:surround_{char2nr('i')} = "*\r*"
let g:surround_{char2nr('8')} = "*\r*"
let g:surround_{char2nr('b')} = "**\r**"
let g:surround_{char2nr('a')} = "***\r***"
let g:surround_{char2nr('s')} = "~~\r~~"
let g:surround_{char2nr('c')} = "`\r`"
let g:surround_{char2nr('u')} = "!u[\r]"
let g:surround_{char2nr('h')} = "==\r=="
" }}}


" vim-commentary: Toggle commenting stuff out. {{{
"    - Use gcc to comment out a line (takes a count)
"    - gc to comment out the target of a motion
"    - gc in visual mode to comment out the selection
"    - gc in operator pending mode to target a comment.
Plug 'https://github.com/tpope/vim-commentary'
" }}}


" vim-repeat: Remaps '.' in a way that plugins can tap into it{{{
Plug 'https://github.com/tpope/vim-repeat'
"}}}


" vim-easy-align: a simple, easy-to-use Vim alignment plugin. {{{
Plug 'https://github.com/junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}


" vim-speeddatign: Use CTRL-A/CTRL-X to increment dates, times, and more {{{
Plug 'https://github.com/tpope/vim-speeddating'

" }}}


" }}}


" EYE CANDY {{{


" vista.vim: View and search LSP symbols, tags in Vim/NeoVim. {{{
Plug 'liuchengxu/vista.vim'
runtime cfgs/vista.vim
" }}}


" goyo.vim: Reading mode {{{
Plug 'https://github.com/junegunn/goyo.vim'
nnoremap <Leader>gg :Goyo<CR>
" }}}


" nerdtree: file system explorer for Vim. {{{
Plug 'https://github.com/preservim/nerdtree'
runtime cfgs/nerdtree.vim
" Adds filetype glyphs (icons) to nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'

" }}}


" }}}


" Async Language Server Protocol plugin for vim8 and neovim.
Plug 'prabirshrestha/vim-lsp'
runtime cfgs/vim-lsp.vim

" A Vim plugin to visualizes the Vim undo tree.
Plug 'https://github.com/simnalamburt/vim-mundo'
nnoremap U <Cmd>MundoToggle<CR>

" Properly render ANSI escape sequences
Plug 'powerman/vim-plugin-AnsiEsc'

" Toggle fullscreen for vim windows, useful when using splits
Plug 'https://github.com/vim-scripts/ZoomWin'

" Text objects and motions for Latex editing
Plug 'gibiansky/vim-latex-objects'

Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/glts/vim-textobj-comment'
" Improving on Vim's native sentence text object and motion
Plug 'https://github.com/preservim/vim-textobj-sentence'
runtime cfgs/vim-textobj-sentence.vim

" Vim sugar for the UNIX shell commands that need it the most
Plug 'https://github.com/tpope/vim-eunuch.git'

" Things you can do with fzf and Vim.
if executable('fzf')
    Plug 'https://github.com/brunofauth/fzf.vim'
    runtime cfgs/fzf.vim
else
    echoerr 'Could not find "fzf" plugin in runtimepath. Make sure "fzf" is installed and the vim plugin it ships with is available in "runtimepath", so that "fzf.vim" can use the functions the missing plugin should be exporting'
    " https://github.com/junegunn/fzf
    " https://github.com/junegunn/fzf.vim
endif

" HTML, CSS abbreviations
Plug 'https://github.com/mattn/emmet-vim/'
runtime cfgs/emmet.vim

" automatic table creator & formatter
Plug 'https://github.com/dhruvasagar/vim-table-mode'

" Autogenerate abbreviations for many variations of a word, according its inflections 
Plug 'https://github.com/brunofauth/vim-inflect-abbr'
runtime cfgs/inflect-abbr.vim

" the ultimate solution for snippets in Vim. It has many features, speed being one of them.
Plug 'https://github.com/SirVer/ultisnips'
runtime cfgs/ultisnips.vim

call plug#end()

