" vim: foldmethod=marker foldlevel=1 foldclose=all
" vim9script

runtime funcs/platf.vim
runtime funcs/util.vim


def! WslToW32(path: string): string
    return trim(SystemFmtEscaped('wslpath -m %s', path))
enddef


def! WriteAndBackUp(): void
    const bak = printf("%s/.%s.bak", expand('%:h'), expand('%:t'))
    silent execute 'write!'
    silent execute 'write!' bak
    echo printf('Wrote "%s" and "%s"', expand('%'), bak)
enddef


def! ThrowIfMissing(exec_file: string): string
    var path = exepath(exec_file)
    if !path
        throw "Couldn't find executable: " .. exec_file
    endif
    return path
enddef


def! WriteToClipboard(data: string): void
    if s:platf == 'w32' || s:platf == 'wsl'
        ThrowIfMissing("clip.exe")
        system('clip.exe', data)
    elseif s:platf == 'gnu' || s:platf == 'mac'
        ThrowIfMissing("xsel")
        system('xsel -ib', data)
    else
        throw 'Unsupported platform'
    endif
enddef


def! g:SaveDeathSession(): void
    if v:dying
        mksession! ~/.cache/vim/death-sess.vim
    endif
enddef


" Remove diacritical signs from characters in specified range of lines.
function s:RemoveDiacritics(begin, end)
    let ilines = join(getline(a:begin, a:end), "\n")
    let olines = iconv(ilines, "utf8", "ascii//TRANSLIT")
    call setline(a:begin, split(olines, "\n"))
endfunction
command! -range=% RemoveDiacritics call s:RemoveDiacritics(<line1>, <line2>)


function s:ToTitleCase(begin, end)
    let fst = '\w\|[áâéêíîóôúûç]'
    let nth = '\l\|[áâéêíîóôúûç]'
    let pattern = printf(' \(%s\)\(\%%(%s\)\%%(%s\)\)', fst, nth, nth)
    let result = ' \u\1\2'

    let offset = 0
    for line in getline(a:begin, a:end)
        call setline(a:begin + offset, line->substitute(pattern, result, 'g'))
        let offset +=1
    endfor
    " call setline(a:begin, map(getline(a:begin, a:end), "substitute(v:value, pattern, result, 'g')"))
endfunction
command! -range ToTitleCase call s:ToTitleCase(<line1>, <line2>)


" -------- QuickFix and LocationList {{{

function s:ToggleQuickFix()
    execute empty(filter(getwininfo(), 'v:val.quickfix')) ? "copen" : "cclose"
endfunction
command! ToggleQuickFix call s:ToggleQuickFix()

function s:ToggleLocList()
    execute empty(filter(getwininfo(), 'v:val.loclist')) ? "silent! lopen" : "lclose"
endfunction
command! ToggleLocList call s:ToggleLocList()

" }}}
