def! g:RFind(line: string, start_pos: number, pattern: string): number
    var curr_pos = start_pos
    while curr_pos > 0 && line[curr_pos - 1] !~ pattern
        --curr_pos
    endwhile
    return curr_pos
enddef


function g:SystemFmt(...)
    return system(call('printf', a:000))
endfunction

function g:SystemFmtEscaped(...)
    return system(call('g:FmtEscaped', a:000))
endfunction

function g:FmtEscaped(...)
    const l:Partial = function('printf', [ a:1 ])
    return call(l:Partial, map(a:000[1:], 'shellescape(v:val)'))
endfunction


def g:MapRange(begin: number, end: number, Fn: func(string): string)
    setline(begin, map(getline(begin, end), Fn))
enddef

