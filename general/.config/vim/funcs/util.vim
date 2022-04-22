def! g:RFind(line: string, start_pos: number, pattern: string): number
    var curr_pos = start_pos
    while curr_pos > 0 && line[curr_pos - 1] !~ pattern
        --curr_pos
    endwhile
    return curr_pos
enddef


function! g:SystemF(...)
    return system(call('printf', a:000))
endfunction

