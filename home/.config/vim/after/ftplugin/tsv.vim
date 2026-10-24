vim9script

import autoload 'colalign.vim'

setlocal noexpandtab
setlocal nowrap
colalign.Align("\t")

command -buffer -count=2 ColAlign colalign.Align("\t", <count>)

augroup colalign
    autocmd! * <buffer>
    autocmd InsertLeave,TextChanged <buffer> colalign.Align("\t")
augroup END

b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin .. ' | ' : '')
  .. "setlocal expandtab< vartabstop< | execute 'autocmd! colalign * <buffer>' | delcommand -buffer ColAlign"
