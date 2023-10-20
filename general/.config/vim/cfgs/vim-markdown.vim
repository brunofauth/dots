" Display Options
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 1
let g:vim_markdown_toc_autofit = 1

let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" Syntax Options
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_frontmatter = 1

let g:vim_markdown_no_default_key_mappings = 0


def s:StrLCount(str: string, chars: string): number
    var accumulator = 0
    for i in range(str->strcharlen())
        if chars->stridx(nr2char(str->strgetchar(i))) != -1
            accumulator += 1
        else | break | endif
    endfor
    return accumulator
enddef


def g:FindListItem(): list<number>
    const line_buf_size = 20
    const list_item_begin_chars = '-+*'

    const cur_pos_line = line(".")
    const last_line = line("$")

    var above_buf_end = cur_pos_line
    var attempts = 0
    var list_item_start = 0
    var list_item_leading_spaces = 0

    while list_item_start == 0 && above_buf_end > 0
        var above_buf_start = above_buf_end - line_buf_size * (attempts + 1)
        above_buf_start = above_buf_start >= 0 ? above_buf_start : 1
        const above_buf = getline(above_buf_start, above_buf_end)

        for i in range(above_buf->len(), 0, -1)

            var curr_str = above_buf->get(i - 1)
            var leading_spaces = curr_str->s:StrLCount(" \t")
            if curr_str->strcharlen() <= leading_spaces
                throw "NoItemInParagraph" | endif
            const fst_non_space = nr2char(curr_str->strgetchar(leading_spaces))
            if list_item_begin_chars->stridx(fst_non_space) == -1
                continue | endif
            list_item_start = above_buf_start + i - 1
            list_item_leading_spaces = leading_spaces
            break
        endfor
        above_buf_end = above_buf_start - 1
        attempts += 1
    endwhile
    if list_item_start == 0 | throw "NoItemInBuffer" | endif

    attempts = 0
    var list_item_end = last_line
    var below_buf_start = cur_pos_line
    while list_item_end == last_line && below_buf_start <= last_line
        var below_buf_end = below_buf_start + line_buf_size * (attempts + 1)
        below_buf_end = below_buf_end > last_line ? last_line : below_buf_end
        const below_buf = getline(below_buf_start, below_buf_end)

        for i in range(below_buf->len())
            var curr_str = below_buf->get(i)
            var leading_spaces = curr_str->s:StrLCount(" \t")
            if (leading_spaces <= list_item_leading_spaces
                    \ && below_buf_start + i != cur_pos_line)
                \ || curr_str->strcharlen() <= leading_spaces
                list_item_end = below_buf_start + i - 1
                break | endif
        endfor
        below_buf_start = below_buf_end + 1
        attempts += 1
    endwhile

    return [list_item_start, list_item_end, list_item_leading_spaces]
enddef

def s:ListItemIndent()
    const [li_begin, li_end, _] = g:FindListItem()
    for i in range(v:count1)
        execute ":" li_begin .. "," .. li_end "normal >>"
    endfor
    silent! call repeat#set("\<Plug>(vim-markdown-ext-li-indent)", v:count)
enddef

def s:ListItemDedent()
    const [li_begin, li_end, _] = g:FindListItem()
    for i in range(v:count1)
        execute ":" li_begin .. "," .. li_end "normal <<"
    endfor
    silent! call repeat#set("\<Plug>(vim-markdown-ext-li-dedent)", v:count)
enddef

def s:RunAtHeader(command: string, count: number)
    const cur_pos = getcurpos()
    execute "normal \<Plug>MdExt_MoveToCurHeader"
    for i in range(count)
        execute ":." command
    endfor
    call setpos(".", cur_pos)
enddef

def s:HeaderDecreaseCurrent()
    s:RunAtHeader("HeaderDecrease", v:count1)
    silent! call repeat#set("\<Plug>(vim-markdown-ext-header-decr-curr)", v:count)
enddef

def s:HeaderIncreaseCurrent()
    s:RunAtHeader("HeaderIncrease", v:count1)
    silent! call repeat#set("\<Plug>(vim-markdown-ext-header-incr-curr)", v:count)
enddef

def s:HeaderDecreaseAll()
    for i in range(v:count1) | HeaderDecrease | endfor
    silent! call repeat#set("\<Plug>(vim-markdown-ext-header-decr-all)", v:count)
enddef

def s:HeaderIncreaseAll()
    for i in range(v:count1) | HeaderIncrease | endfor
    silent! call repeat#set("\<Plug>(vim-markdown-ext-header-incr-all)", v:count)
enddef

augroup vim_markdown_cfg
    autocmd!
    autocmd FileType *markdown* noremap <buffer> <Plug>(vim-markdown-ext-header-decr-curr) <Cmd>call <SID>HeaderDecreaseCurrent()<CR>
    autocmd FileType *markdown*     map <buffer> <Leader><h <Plug>(vim-markdown-ext-header-decr-curr)
    autocmd FileType *markdown* noremap <buffer> <Plug>(vim-markdown-ext-header-incr-curr) <Cmd>call <SID>HeaderIncreaseCurrent()<CR>
    autocmd FileType *markdown*     map <buffer> <Leader>>h <Plug>(vim-markdown-ext-header-incr-curr)

    autocmd FileType *markdown* noremap <buffer> <Plug>(vim-markdown-ext-header-decr-all) <Cmd>call <SID>HeaderDecreaseAll()<CR>
    autocmd FileType *markdown*     map <buffer> <Leader><H <Plug>(vim-markdown-ext-header-decr-all)
    autocmd FileType *markdown* noremap <buffer> <Plug>(vim-markdown-ext-header-incr-all) <Cmd>call <SID>HeaderIncreaseAll()<CR>
    autocmd FileType *markdown*     map <buffer> <Leader>>H <Plug>(vim-markdown-ext-header-incr-all)

    autocmd FileType *markdown* noremap <buffer> <Plug>(vim-markdown-ext-li-dedent) <Cmd>call <SID>ListItemDedent()<CR>
    autocmd FileType *markdown*     map <buffer> <Leader><i <Plug>(vim-markdown-ext-li-dedent)
    autocmd FileType *markdown* noremap <buffer> <Plug>(vim-markdown-ext-li-indent) <Cmd>call <SID>ListItemIndent()<CR>
    autocmd FileType *markdown*     map <buffer> <Leader>>i <Plug>(vim-markdown-ext-li-indent)

    " autocmd FileType *markdown* map <buffer> ]] :<C-U>execute "normal \<Plug>Markdown_MoveToNextHeader"<Bar>
    "     \ silent! call repeat#set("\<Plug>Markdown_MoveToNextHeader")<CR>
    " autocmd FileType *markdown* map <buffer> [[ :<C-U>execute "normal \<Plug>Markdown_MoveToPreviousHeader"<Bar>
    "     \ silent! call repeat#set("\<Plug>Markdown_MoveToPreviousHeader")<CR>
    " autocmd FileType *markdown* map <buffer> ][ :<C-U>execute "normal \<Plug>Markdown_MoveToNextSiblingHeader"<Bar>
    "     \ silent! call repeat#set("\<Plug>Markdown_MoveToNextSiblingHeader")<CR>
    " autocmd FileType *markdown* map <buffer> [] :<C-U>execute "normal \<Plug>Markdown_MoveToPreviousSiblingHeader"<Bar>
    "     \ silent! call repeat#set("\<Plug>Markdown_MoveToPreviousSiblingHeader")<CR>
    " autocmd FileType *markdown* map <buffer> ]u :<C-U>execute "normal \<Plug>Markdown_MoveToParentHeader"<Bar>
    "     \ silent! call repeat#set("\<Plug>Markdown_MoveToParentHeader")<CR>
    " autocmd FileType *markdown* map <buffer> ]h :<C-U>execute "normal \<Plug>Markdown_MoveToCurHeader"<Bar>
    "     \ silent! call repeat#set("\<Plug>Markdown_MoveToCurHeader")<CR>
    " autocmd FileType *markdown* map <buffer> gx :<C-U>execute "normal \<Plug>Markdown_OpenUrlUnderCursor"<Bar>
    "     \ silent! call repeat#set("\<Plug>Markdown_OpenUrlUnderCursor")<CR>
    " autocmd FileType *markdown* map <buffer> ge :<C-U>execute "normal \<Plug>Markdown_EditUrlUnderCursor"<Bar>
    "     \ silent! call repeat#set("\<Plug>Markdown_EditUrlUnderCursor")<CR>
    
augroup END

" Todo: add 'ih' e 'ah' heading motions objects

