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


function s:EnumLinesInner(start, step, col, fmt, index, value)
    const l:head = slice(a:value, 0, a:col - 1)
    const l:tail = slice(a:value, a:col - 1)
    return printf(a:fmt, l:head, a:index * a:step + a:start, l:tail)
endfunction

function s:EnumLines(range_begin, range_end, count_start=1, count_step=1, fmt="%s%02d. %s")
    try
        const l:block_bounds = s:GetVisualBlockBounds()
        if s:VisualMarksMatchRange(l:block_bounds, [a:range_begin, a:range_end])
            const l:col = s:VisualSelectionStartCol(l:block_bounds)
        else
            const l:col = 1
        endif
    catch /.*/
        const l:col = 1
    endtry
    let l:Partial = function('s:EnumLinesInner', [a:count_start, a:count_step, l:col, a:fmt])
    const l:result = map(getline(a:range_begin, a:range_end), l:Partial)
    call setline(a:range_begin, l:result)
endfunction
command! -range -nargs=* EnumLines call s:EnumLines(<line1>, <line2>, <f-args>)

function s:VisualSelectionStartCol(visual_block_bounds)
    let l:visual_mode = visualmode()
    if     l:visual_mode == 'V' || l:visual_mode == ''  | return 1
    elseif l:visual_mode == '' | return s:GetBlockStartCol(a:visual_block_bounds)
    endif
    throw "bad visual mode; use 'V' or '', but not 'v'"
endfunction

function s:VisualMarksMatchRange(visual_block_bounds, range)
    if a:visual_block_bounds['<'][0] < a:visual_block_bounds['>'][0]
        return a:visual_block_bounds['<'][0] == a:range[0] && a:visual_block_bounds['>'][0] == a:range[1]
    else
        return a:visual_block_bounds['>'][0] == a:range[0] && a:visual_block_bounds['<'][0] == a:range[1]
    endif
endfunction

function s:GetVisualBlockBounds()
    let l:found = 0
    let l:result = {}
    for l:mark in getmarklist(bufname())
        if l:found == 2
            break
        endif
        if l:mark->get('mark') == "'<"
            let l:result['<'] = l:mark->get('pos')[1:2]
            let l:found += 1
            continue
        endif
        if l:mark->get('mark') == "'>"
            let l:result['>'] = l:mark->get('pos')[1:2]
            let l:found += 1
            continue
        endif
    endfor
    if found < 2
        throw "Couldn't find all required marks"
    endif
    return l:result
endfunction

function s:GetBlockStartCol(visual_block_bounds)
    let l:lt_col = a:visual_block_bounds['<'][1]
    let l:gt_col = a:visual_block_bounds['>'][1]
    return l:lt_col < l:gt_col ? l:lt_col : l:gt_col
endfunction

