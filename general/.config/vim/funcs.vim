def WriteAndBackUp(): void
    const bak = printf("%s/.%s.bak", expand('%:h'), expand('%:t'))
    silent execute 'write!'
    silent execute 'write!' bak
    echo printf('Wrote "%s" and "%s"', expand('%'), bak)
enddef

def WriteToClipboard(data: string): void
    if has('win32')
        if executable('clip.exe')
            system('clip.exe', data)
        else
            echoerr 'You seem to be missing "clip.exe", hows that even possible?'
        endif
    elseif has('unix')
        if (stridx(system('uname -r'), 'microsoft') != -1) && executable('clip.exe')
            system('clip.exe', data))
        elseif executable('xsel')
            system('xsel -ib', data))
        else
            echoerr 'Please, install "xsel" to use this feature.'
        endif
    else
        echoerr 'Running on unsupported platform.'
    endif
enddef


