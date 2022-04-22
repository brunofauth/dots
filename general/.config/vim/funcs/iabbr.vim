def! IabbrPlural(base_abbr: string, full_sg: string, full_pl: string = ""): void
    silent execute "iabbr"  base_abbr full_sg
    silent execute "iabbr" (base_abbr .. 's') (full_pl != "" ? full_pl : full_sg .. "s")
enddef
command! -nargs=+ IabbrPlural call IabbrPlural(<f-args>)


def! IabbrGenderPlural(base_abbr: string, root: string, m_sg: string="", f_sg: string="", m_pl: string="", f_pl: string=""): void
    silent execute "iabbr" base_abbr .. (m_sg == "" ? "o"  : m_sg) root .. (m_sg == "" ? "o"  : m_sg)
    silent execute "iabbr" base_abbr .. (f_sg == "" ? "a"  : f_sg) root .. (f_sg == "" ? "a"  : f_sg)
    silent execute "iabbr" base_abbr .. (m_pl == "" ? "os" : m_pl) root .. (m_pl == "" ? "os" : m_pl)
    silent execute "iabbr" base_abbr .. (f_pl == "" ? "as" : f_pl) root .. (f_pl == "" ? "as" : f_pl)
enddef
command! -nargs=+ IabbrGenderPlural call IabbrGenderPlural(<f-args>)

