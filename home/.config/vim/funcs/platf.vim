let g:platform = 'unsupported'

if has('win32')
    let s:platf = 'w32'
elseif has('unix')
    let original_shell = &shell
    setlocal shell=/bin/sh " If shell was fish, system() would throw E484
    if stridx(system('uname -r'), 'microsoft') != -1
        let s:platf = 'wsl'
    elseif system('uname') ==# 'Darwin'
        let s:platf = 'mac'
    else
        let s:platf = 'gnu'
    endif
    let &shell = original_shell
endif

