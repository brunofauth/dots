" vim9script


let s:platf = 'unsupported'

if has('win32')
    let s:platf = 'w32'
elseif has('unix')
    if stridx(system('uname -r'), 'microsoft') != -1
        let s:platf = 'wsl'
    elseif system('uname') == 'Darwin'
        let s:platf = 'mac'
    else
        let s:platf = 'gnu'
    endif
endif


func SystemF(...)
    return system(call('printf', a:000))
endfunc


def WslToW32(path: string): string
    return trim(SystemF('wslpath -m "%s"', path))
enddef


def WriteAndBackUp(): void
    const bak = printf("%s/.%s.bak", expand('%:h'), expand('%:t'))
    silent execute 'write!'
    silent execute 'write!' bak
    echo printf('Wrote "%s" and "%s"', expand('%'), bak)
enddef


def WriteToClipboard(data: string): void
    if s:platf == 'w32' || s:platf == 'wsl'
        if executable('clip.exe')
            system('clip.exe', data)
        else
            throw 'Missing "clip.exe"'
        endif
    elseif s:platf == 'gnu' || s:platf == 'mac'
        if executable('xsel')
            system('xsel -ib', data)
        else
            throw 'Please, install "xsel"'
        endif
    else
        throw 'Unsupported platform'
    endif
enddef


def TakeScreenshot(out_fmt: string): void
    if s:platf == 'w32' || s:platf == 'wsl'

        var spath = exepath('screenshot.ps1')
        spath = s:platf == 'wsl' ? WslToW32(spath) : spath

        if !!spath
            SystemF("powershell.exe -File '%s' '%s'", spath, out_fmt)
        else
            throw 'Missing "screenshot.ps1"'
        endif

    elseif s:platf == 'gnu' || s:platf == 'mac'
        # python3 << endpython3
        # import mss
        # import vim
        # endpython3
    endif
enddef


def SaveScreenshot(out_dir: string='', mk_dirs: bool=true): string

    const wcmd = 'powershell -Command Get-Date -UFormat %Y-%m-%d_%H-%M-%S_.png'
    const ucmd = 'date "+%Y-%m-%d_%H-%M-%S_.png"'
    const fname = trim(system(s:platf == 'w32' ? wcmd : ucmd))
    
    if s:platf != 'w32' && !executable('date')
        throw 'Unsupported platform.'
    endif

    var dname = !!out_dir ? out_dir : getcwd()
    if !isdirectory(out_dir)
        if mk_dirs
            mkdir(dname, 'p')
        else
            throw printf('Directory "%s" does not exist')
        endif
    endif

    dname = s:platf == 'wsl' ? WslToW32(dname) : dname
    const out_file = printf("%s/%s", dname, fname)

    TakeScreenshot(out_file)
    return out_file

enddef


def SaveDeathSession(): void
    if v:dying
        mksession! ~/.cache/vim/death-sess.vim
    endif
enddef

