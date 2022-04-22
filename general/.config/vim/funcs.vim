" vim9script

runtime funcs/platf.vim
runtime funcs/util.vim
runtime funcs/iabbr.vim


def! WslToW32(path: string): string
    return trim(SystemF('wslpath -m "%s"', path))
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


def! TakeScreenshot(out_fmt: string): void

    if s:platf == 'w32' || s:platf == 'wsl'
        var spath = ThrowIfMissing('screenshot.ps1')
        spath = s:platf == 'wsl' ? WslToW32(spath) : spath
        SystemF("powershell.exe -File '%s' '%s'", spath, out_fmt)

    elseif s:platf == 'gnu' || s:platf == 'mac'
        ThrowIfMissing("import")
        SystemF("import -window root '%s'", out_fmt)

    endif
enddef


def! SaveScreenshot(out_dir: string='', mk_dirs: bool=true): string

    const win32_cmd = 'powershell -Command Get-Date -UFormat %Y-%m-%d_%H-%M-%S_.png'
    const linux_cmd = 'date "+%Y-%m-%d_%H-%M-%S_.png"'
    const file_name = trim(system(s:platf == 'w32' ? win32_cmd : linux_cmd))
    
    if s:platf != 'w32' && !executable('date')
        throw 'Unsupported platform.'
    endif

    var dname = !!out_dir ? out_dir : (expand("%:p") .. ".shots")
    if !isdirectory(out_dir)
        if !mk_dirs
            throw printf('Directory "%s" does not exist')
        endif
        mkdir(dname, 'p')
    endif

    dname = s:platf == 'wsl' ? s:WslToW32(dname) : dname
    const out_file = printf("%s/%s", dname, file_name)

    s:TakeScreenshot(out_file)
    return out_file

enddef


def! SaveDeathSession(): void
    if v:dying
        mksession! ~/.cache/vim/death-sess.vim
    endif
enddef


" Remove diacritical signs from characters in specified range of lines.
function! s:RemoveDiacritics(begin, end)
    let ilines = join(getline(a:begin, a:end), "\n")
    let olines = system("iconv -f utf8 -t ascii//TRANSLIT", ilines)
    call setline(a:begin, split(olines, "\n"))
endfunction
command! -range=% RemoveDiacritics call s:RemoveDiacritics(<line1>, <line2>)

