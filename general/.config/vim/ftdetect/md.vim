vim9script


def GetAbbrHome(): string
    if !empty($XDG_CONFIG_HOME)
        return $XDG_CONFIG_HOME .. '/vim/abbr'
    endif
    return $HOME .. '/.config/vim/abbr'
enddef


def LoadAbbrCompletions(): list<dict<string>>

    const abbr_dir = GetAbbrHome()
    const grep_out = system("grep ^[iI]abbr '" .. GetAbbrHome() .. "/med-pt.abbr'")
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


augroup ftdetect_md
    autocmd!
    autocmd BufRead,BufNewFile *.md runtime! abbr/*.abbr
    autocmd BufRead,BufNewFile *.md setlocal omnifunc=s:CompleteAbbrs
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=pt_br,en_us
augroup END


# :help ft-markdown-plugin
g:markdown_folding = 1

