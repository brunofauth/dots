def s:EnumLines(range_begin: number, range_end: number,
        count_start: number = 1, count_step: number = 1, fmt: string = "%s%02d. %s")
    const [lt_pos, gt_pos] = s:GetVisualBlockBounds()
    const rb_is_lt = lt_pos->g:AndThen((n) => n[0])->g:AndThen((num) => num == range_begin)->g:UnwrapOr(v:false)
    const re_is_gt = gt_pos->g:AndThen((n) => n[0])->g:AndThen((num) => num == range_end)->g:UnwrapOr(v:false)
    const column = !rb_is_lt || !re_is_gt ? 1 : s:VisualSelectionStartCol(min([lt_pos->g:Unwrap()[1], gt_pos->g:Unwrap()[1]]))

    const Partial = function(s:EnumLinesInner, [count_start, count_step, column, fmt])
    const result = map(getline(range_begin, range_end), Partial)
    setline(range_begin, result)
enddef

command! -range -nargs=* EnumLines call s:EnumLines(<line1>, <line2>, <f-args>)

def s:GetVisualBlockBounds(): list<any>
    const mark_pos = s:GetMarkPos("'<", "'>")
    const lt_pos = mark_pos->g:GetOrNone("'<")->g:AndThen((pos) => pos[1 : 2])
    const gt_pos = mark_pos->g:GetOrNone("'>")->g:AndThen((pos) => pos[1 : 2])
    return lt_pos->g:AndThen((pos1) => gt_pos->g:AndThen((pos2) => pos1[0] < pos2[0]))->g:UnwrapOr(v:true) ? [lt_pos, gt_pos] : [gt_pos, lt_pos]
enddef

def s:VisualSelectionStartCol(lt_col: number): number
    const visual_mode = visualmode()
    if visual_mode == '' | return lt_col | endif
    if visual_mode == 'V' || visual_mode == ''  | return 1 | endif
    throw "InvalidVisualModeType"
    return 1
enddef

def s:EnumLinesInner(start: number, step: number, col: number, fmt: string, index: number, value: string): string
    const column = col - 1 # Vim uses 1-based columns, but I want 0-based slices
    const head = slice(value, 0, column)
    const tail = slice(value, column)
    return printf(fmt, head, index * step + start, tail)
enddef

def s:GetMarkPos(...marks: list<string>): dict<any>
    var found_count = 0
    var found_items = {}
    for mark_info in getmarklist(bufname())
        if found_count == len(marks) | break | endif
        const mark_idx = index(marks, mark_info['mark'])
        if mark_idx == -1 | continue | endif
        found_items[marks[mark_idx]] = mark_info['pos']
    endfor
    return found_items
enddef

