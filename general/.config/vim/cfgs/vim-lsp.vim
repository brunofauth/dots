function! s:get_capabilities_without_formatting()
    let l:capabilities = lsp#default_get_supported_capabilities({})
    call remove(l:capabilities.textDocument, 'formatting')
    call remove(l:capabilities.textDocument, 'rangeFormatting')
    return l:capabilities
endfunction


if executable('rust-analyzer')
    augroup vim_lsp_rust
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'rust-analyzer',
            \ 'cmd': {server_info->['rust-analyzer']},
            \ 'allowlist': ['rust'],
            \ 'capabilities': s:get_capabilities_without_formatting(),
            \ })
    augroup END
else
    echoerr "Couldn't find 'rust-analyzer'"
endif


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
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
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    augroup lsp_on_enable
        autocmd!
        autocmd BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    augroup END
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
