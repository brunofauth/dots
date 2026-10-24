vim9script

# Vim's own ftplugin/csv.vim guesses the delimiter (, ; tab |) into
# b:csv_delimiter; fall back to a comma if it is not set.

import autoload 'colalign.vim'

setlocal nowrap
colalign.Align(get(b:, 'csv_delimiter', ','))
command -buffer -count=2 ColAlign colalign.Align(get(b:, 'csv_delimiter', ','), <count>)

augroup colalign
    autocmd! * <buffer>
    autocmd InsertLeave,TextChanged <buffer> colalign.Align(get(b:, 'csv_delimiter', ','))
augroup END

b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin .. ' | ' : '')
  .. "setlocal vartabstop< | execute 'autocmd! colalign * <buffer>' | delcommand -buffer ColAlign | call colalign#Clear()"
