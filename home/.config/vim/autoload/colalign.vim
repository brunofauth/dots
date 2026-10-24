vim9script

# Align the columns of a delimiter-separated buffer (TSV, CSV, ...).
#
# Tab separator: sets 'vartabstop', so each tab stretches to its column width.
# Other separators: pads after each separator with virtual text (text
# properties, Vim 9.0.0067+). The buffer text itself is never modified.

const PROP = 'colalign_pad'

# Split one line into fields. A field wrapped in double quotes (with "" as an
# escaped quote) may contain the separator; anything else ends at the next
# separator. Returns one dict per field: its display width, and the 0-based
# byte index of the separator that follows it (-1 for the last field).
def Fields(line: string, sep: string): list<dict<number>>
    const cls = escape(sep, '^]\-')
    const pat = '^\%("\%([^"]\|""\)*"\ze\%([' .. cls .. ']\|$\)\|[^' .. cls .. ']*\)'
    var fields: list<dict<number>> = []
    var pos = 0
    while true
        const [text, _, stop] = matchstrpos(line, pat, pos)
        if stop < len(line)
            fields->add({width: strdisplaywidth(text), sepcol: stop})
            pos = stop + len(sep)
        else
            fields->add({width: strdisplaywidth(text), sepcol: -1})
            break
        endif
    endwhile
    return fields
enddef

# Remove the padding added by Align() from the current buffer.
export def Clear()
    if !prop_type_get(PROP)->empty()
        prop_remove({type: PROP, all: true})
    endif
enddef

# Align the current buffer on single-character separator {sep}, leaving at
# least {pad} columns between the widest field of a column and the next one.
export def Align(sep: string, pad: number = 2)
    const rows = getline(1, '$')->mapnew((_, line) => Fields(line, sep))
    var widths: list<number> = []
    for row in rows
        for i in range(len(row))
            if i >= len(widths)
                widths->add(row[i].width)
            elseif row[i].width > widths[i]
                widths[i] = row[i].width
            endif
        endfor
    endfor
    if widths->empty()
        return
    endif

    if sep == "\t"
        &l:vartabstop = widths->mapnew((_, w) => w + pad)->join(',')
        return
    endif

    if !has('patch-9.0.0067')
        echoerr 'colalign: aligning on non-tab separators needs Vim 9.0.0067+'
        return
    endif
    if prop_type_get(PROP)->empty()
        prop_type_add(PROP, {})
    endif
    Clear()
    const sepwidth = strdisplaywidth(sep)
    for lnum in range(1, len(rows))
        const row = rows[lnum - 1]
        for i in range(len(row) - 1)
            const n = widths[i] + pad - row[i].width - sepwidth
            if n > 0
                prop_add(lnum, row[i].sepcol + len(sep) + 1, {type: PROP, text: repeat(' ', n)})
            endif
        endfor
    endfor
enddef
