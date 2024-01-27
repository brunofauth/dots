" Enable just for html/css
let g:user_emmet_install_global = 0

augroup emmet_install
    autocmd!
    autocmd FileType html,css,svelte,svelte-html EmmetInstall
augroup END


"To remap the default <C-Y> leader:
let g:user_emmet_leader_key='<C-Z>'

