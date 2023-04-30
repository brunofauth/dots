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


def g:EnumLines(range_begin: number, range_end: number, count_start: number = 1, count_step: number = 1, fmt: string = "%s%02d. %s")
    const Get = function('get')
    var [lt_pos, gt_pos] = g:GetVisualBlockBounds()
    const rb_is_lt = lt_pos->g:AndThen((n, ..._) => n[0], [])->g:AndThen((num, ..._) => num == range_begin, [])->g:UnwrapOr(v:false)
    const re_is_gt = gt_pos->g:AndThen((n, ..._) => n[0], [])->g:AndThen((num, ..._) => num == range_end, [])->g:UnwrapOr(v:false)
    const column = !rb_is_lt || !re_is_gt ? 1
        \ : g:VisualSelectionStartCol(lt_pos->g:Unwrap()[1] < gt_pos->g:Unwrap()[1] ? lt_pos[1] : gt_pos[1])

    const Partial = function(g:EnumLinesInner, [count_start, count_step, column, fmt])
    const result = map(getline(range_begin, range_end), Partial)
    setline(range_begin, result)
enddef
command! -range -nargs=* EnumLines call g:EnumLines(<line1>, <line2>, <f-args>)

def g:GetVisualBlockBounds(): list<any>
    var mark_pos = g:GetMarkPos("'<", "'>")
    var lt_pos = mark_pos->g:GetOrNone("'<")->g:AndThen((pos, ..._) => pos[1 : 2], [])
    var gt_pos = mark_pos->g:GetOrNone("'>")->g:AndThen((pos, ..._) => pos[1 : 2], [])
    return [lt_pos, gt_pos]
enddef

def g:VisualSelectionStartCol(lt_col: number): number
    const visual_mode = visualmode()
    if visual_mode == '' | return lt_col | endif
    if visual_mode == 'V' || visual_mode == ''  | return 1 | endif
    throw "InvalidVisualModeType"
    return 1
enddef

def g:EnumLinesInner(start: number, step: number, col: number, fmt: string, index: number, value: string): string
    var column = col - 1 # Vim uses 1-based columns, but I want 0-based slices
    var head = slice(value, 0, column)
    var tail = slice(value, column)
    return printf(fmt, head, index * step + start, tail)
enddef

def g:GetMarkPos(...marks: list<string>): dict<any>
    var found_count = 0
    var found_items = {}
    for mark_info in getmarklist(bufname())
        if found_count == len(marks) | break | endif
        var mark_idx = index(marks, mark_info['mark'])
        if mark_idx == -1 | continue | endif
        found_items[marks[mark_idx]] = mark_info['pos']
    endfor
    return found_items
enddef

