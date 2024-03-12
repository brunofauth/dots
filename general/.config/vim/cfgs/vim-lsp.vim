" for signs and virtual text. To set unique virtual text highlighting, you
" can set or link `LspErrorVirtualText`, `LspWarningVirtualText`,
" `LspInformationVirtualText` and `LspHintVirtualText` highlight groups.

let g:lsp_use_native_client = 1
let g:lsp_format_sync_timeout = 1000
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_signature_help_enabled = 1
let g:lsp_signature_help_delay = 50
let g:lsp_ignorecase = v:false
let g:lsp_semantic_enabled = v:true
" let g:lsp_log_file = $HOME . '/vim-lsp.log'


if executable('rust-analyzer')
    augroup vim_lsp__rust__rust_analyzer
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'rust-analyzer',
            \ 'cmd': {server_info->['rust-analyzer']},
            \ 'allowlist': ['rust'],
            \ })
    augroup END
else
    echoerr "Couldn't find 'rust-analyzer'"
endif

" https://github.com/palantir/python-language-server/blob/develop/vscode-client/package.json
" https://github.com/python-lsp/python-lsp-ruff
if executable('pylsp')
    augroup vim_lsp__python__pylsp
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'pylsp',
            \ 'cmd': {server_info->[
                \ 'pylsp',
                \ '-vv'
            \ ]},
            \ 'whitelist': ['python'],
            \ 'workspace_config': {
                \ 'pylsp': {
                    \ 'plugins': {
                        \ 'autopep8': {'enabled': v:false},
                        \ 'yapf': {'enabled': v:true},
                        \ 'rope_autoimport': {'enabled': v:false},
                        \ 'rope_completion': {'enabled': v:true},
                        \ 'black': {
                            \ 'enabled': v:false,
                            \ 'line_length': 120,
                            \ 'skip_string_normalization': v:true,
                            \ 'skip_magic_trailing_comma': v:false
                        \ },
                        \ 'ruff': {'enabled': v:false}
                    \ }
                \ }
            \ }
        \ })
    augroup END
endif

if executable('texlab')
    augroup vim_lsp__tex__texlab
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'texlab',
            \ 'cmd': {server_info->['texlab']},
            \ 'allowlist': ['tex']
        \ })
    augroup END
else
    echoerr "Couldn't find 'texlab'"
endif

if executable('marksman')
    augroup vim_lsp__md__marksman
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'marksman',
            \ 'cmd': {server_info->['marksman']},
            \ 'allowlist': ['markdown', 'markdown.pandoc']
        \ })
    augroup END
else
    echoerr "Couldn't find 'marksman'"
endif

if executable('arduino-language-server')
    augroup vim_lsp__ino__arduino_language_server
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'arduino-language-server',
            \ 'cmd': {server_info->[
                \ 'arduino-language-server',
                \ '-cli', '/usr/bin/arduino-cli',
                \ '-cli-config', '/home/bruno/.config/arduino-cli/arduino.conf' ]},
            \ 'allowlist': ['arduino']
        \ })
    augroup END
else
    echoerr "Couldn't find 'arduino-language-server'"
endif

if executable('clangd')
    augroup vim_lsp__cpp__clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->[
                \ 'clangd',
                \ '--background-index',
                \ '--clang-tidy',
                \ '--header-insertion=iwyu',
                \ '--header-insertion-decorators']},
            \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp']
        \ })
    augroup END
endif

if executable('vim-language-server')
    augroup vim_lsp__vim__vim_language_server
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'vim-language-server',
            \ 'cmd': {server_info->['vim-language-server', '--stdio']},
            \ 'allowlist': ['vim'],
            \ 'initialization_options': {
            \     'isNeovim': v:false,
            \     'vimruntime': $VIMRUNTIME,
            \     'runtimepath': &rtp,
            \     'diagnostic': { 'enable': v:true },
            \     'indexes': { 'runtimepath': v:true },
            \     'suggest': {
            \         'fromVimruntime': v:true,
            \         'fromRuntimepath': v:true,
            \     }
            \ }
    \ })
    augroup END
else
    echoerr "Couldn't find 'vim-language-server'"
endif

if executable('sqlfluff-language-server')
  augroup vim_lsp__sql__sqlfluff_language_server
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'sqlfluff-language-server',
        \ 'cmd': {server_info->['sqlfluff-language-server']},
        \ 'allowlist': ['sql'],
        \ 'workspace_config': {'sqlfluff-ls': {'dialect': 'sqlite'}},
        \ 'initialization_options': {'sqlfluff-ls': {'dialect': 'sqlite'}, 'dialect': 'sqlite'},
    \ })
  augroup END
endif

if executable('typescript-language-server')
  augroup vim_lsp__typescript__typescript_language_server
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
        \ 'allowlist': ['javascript', 'typescript'],
        \ 'initialization_options': {'plugins': []}
    \ })
  augroup END
endif

if executable('tailwindcss-language-server')
  augroup vim_lsp__css__tailwindcss_language_server
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'tailwindcss-language-server',
        \ 'cmd': {server_info->['tailwindcss-language-server', '--stdio']},
        \ 'allowlist': ['css', 'html'],
        \ 'workspace_config': {},
        \ 'initialization_options': {'plugins': []}
    \ })
  augroup END
endif

if executable('svelteserver')
  augroup vim_lsp__svelte__svelteserver
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'svelteserver',
        \ 'cmd': {server_info->['svelteserver', '--stdio']},
        \ 'allowlist': ['svelte'],
        \ 'workspace_config': {},
        \ 'initialization_options': {'plugins': []}
    \ })
  augroup END
endif

if executable('kotlin-language-server')
  augroup vim_lsp__kotlin__kotlin_lanugage_server
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'kotlin-language-server',
        \ 'cmd': {server_info->['kotlin-language-server']},
        \ 'allowlist': ['kotlin'],
        \ 'workspace_config': {},
        \ 'initialization_options': {'plugins': []}
    \ })
  augroup END
endif

if executable('cmake-language-server')
  augroup vim_lsp__txt__cmake_language_server
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'cmake-language-server',
        \ 'cmd': {server_info->['cmake-language-server']},
        \ 'allowlist': ['cmake'],
        \ 'workspace_config': {},
        \ 'initialization_options': {'plugins': []}
    \ })
  augroup END
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal tagfunc=lsp#tagfunc
    setlocal signcolumn=yes

    nmap <buffer> <Leader>ld <plug>(lsp-definition)
    nmap <buffer> <Leader>ls <plug>(lsp-document-symbol-search)
    nmap <buffer> <Leader>lS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <Leader>lR <plug>(lsp-references)
    nmap <buffer> <Leader>li <plug>(lsp-implementation)
    nmap <buffer> <Leader>lt <plug>(lsp-type-definition)
    nmap <buffer> <Leader>lr <plug>(lsp-rename)
    nmap <buffer> <leader>lk <plug>(lsp-hover)
    nmap <buffer> <Leader>le <plug>(lsp-document-diagnostics)
    nmap <buffer> <Leader>la <plug>(lsp-code-action)
    nmap <buffer> <Leader>lf <plug>(lsp-signature-help)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    augroup lsp_on_enable
        autocmd!
        autocmd BufWritePre *.rs,*.py,*.html,*.ts,*.js,*.svelte,*.css call execute('LspDocumentFormatSync')
    augroup END

endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
