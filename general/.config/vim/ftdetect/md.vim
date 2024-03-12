vim9script


def GetVimHome(): string
    if !empty($XDG_CONFIG_HOME)
        return $XDG_CONFIG_HOME .. '/vim'
    endif
    return $HOME .. '/.config/vim'
enddef

def GetAbbrHome(): string
    return GetVimHome() .. '/abbr'
enddef

def GetSpellHome(): string
    return GetVimHome() .. '/spell'
enddef

def GetSpellFiles(file_names: list<string>): string
    var file_pathes = []
    for file_name in file_names
        file_pathes->add(GetSpellHome() .. '/' .. file_name .. '.add')
    endfor
    return file_pathes->join(',')
enddef


def LoadAbbrCompletions(): list<dict<string>>

    const abbr_dir = GetAbbrHome()
    const grep_out = g:SystemFmtEscaped("grep ^[iI]abbr %s", GetAbbrHome() .. "/med-pt.abbr")
    const cut_out = systemlist("cut -d ' ' -f 2-", grep_out)

    var completions = []
    for line in cut_out
        const parts = line->split()
        const word = parts[1 : ]->join()
        completions->add({"word": word, "abbr": parts[0], "menu": word})
    endfor

    return completions
enddef


var abbr_completions: list<dict<string>>

# def g:CompleteAbbrs(findstart: number, base: string): any #: #any # number || list<dict<string>>
function CompleteAbbrs(findstart, base)

    if a:findstart
        return g:RFind(getline('.'), col('.'), '\s')
    endif

    if s:abbr_completions->empty()
        let s:abbr_completions = s:LoadAbbrCompletions()
    endif

    return copy(s:abbr_completions)->filter('v:val["abbr"] =~ "^" .. a:base')

endfunction


# :help ft-markdown-plugin
g:markdown_folding = 1


function ToggleCheckBox(begin, end)
    let offset = 0
    for line in getline(a:begin, a:end)
        if line->stridx("[ ]") != -1
            call setline(a:begin + offset, substitute(line, '\[ \]', '[X]', 'g'))
        elseif line->stridx("[X]") != -1
            call setline(a:begin + offset, substitute(line, '\[X\]', '[ ]', 'g'))
        endif
        let offset += 1
    endfor
endfunction


function ToggleCheckBoxWrapper(object_type)
endfunction


function ToggleCheckBoxObject()
    setlocal operatorfunc=s:ToggleCheckBoxWrapper
    normal g@
endfunction


# function ItemsToLine(begin, end, prefix="- ", sep=";")
#     let re_in = printf('^\s*%s', a:prefix)
# endfunction


augroup ftdetect_md
    autocmd!
    autocmd BufRead,BufNewFile *.md runtime! abbr/*.abbr
    autocmd BufRead,BufNewFile *.md setlocal omnifunc=s:CompleteAbbrs
    # autocmd BufRead,BufNewFile *.md setlocal spell spelllang=pt_br,en_us | legacy let &l:spellfile = s:GetSpellFiles(['pt.utf-8', 'en.utf-8'])
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=pt | legacy let &l:spellfile = s:GetSpellFiles(['pt.utf-8'])

    autocmd BufRead,BufNewFile *.md command! -buffer -range ToggleCheckBox call ToggleCheckBox(<line1>, <line2>)
    autocmd BufRead,BufNewFile *.md noremap <buffer> <Leader>t :ToggleCheckBox<CR>

    autocmd BufRead,BufNewFile *.md command! -buffer -range ToggleCheckBoxObject call ToggleCheckBoxObject()
    autocmd BufRead,BufNewFile *.md noremap <buffer> <Leader>T :ToggleCheckBoxObject<CR>

    autocmd FileType *markdown* setlocal formatoptions+=wa
augroup END

