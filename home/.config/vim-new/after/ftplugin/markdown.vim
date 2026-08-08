vim9script

if get(g:, 'vim_markdown_no_default_key_mappings', 0)
    map <buffer> ]] <Plug>Markdown_MoveToNextHeader
    map <buffer> [[ <Plug>Markdown_MoveToPreviousHeader
    map <buffer> ][ <Plug>Markdown_MoveToNextSiblingHeader
    map <buffer> [] <Plug>Markdown_MoveToPreviousSiblingHeader
    map <buffer> ]u <Plug>Markdown_MoveToParentHeader
    map <buffer> ]h <Plug>Markdown_MoveToCurHeader
    map <buffer> gx <Plug>Markdown_OpenUrlUnderCursor
    map <buffer> ge <Plug>Markdown_EditUrlUnderCursor
endif

# Mappings for preservim/vim-markdown to use tpope/vim-repeat
if !get(g:, 'is_repeat_installed_for_markdown', 0)
    # TODO: None of this REPEATing business is working SOMEWHY
    # Fucking docs say: 
    #     Adding support to a plugin is generally as simple as the following
    #     command at the end of your map functions.
    #         silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
    # My ass!
    g:repeat#set("\<Plug>Markdown_MoveToNextHeader", v:count)
    g:repeat#set("\<Plug>Markdown_MoveToPreviousHeader", v:count)
    g:repeat#set("\<Plug>Markdown_MoveToNextSiblingHeader", v:count)
    g:repeat#set("\<Plug>Markdown_MoveToPreviousSiblingHeader", v:count)
    g:repeat#set("\<Plug>Markdown_MoveToParentHeader", v:count)
    g:repeat#set("\<Plug>Markdown_MoveToCurHeader", v:count)
    g:repeat#set("\<Plug>Markdown_OpenUrlUnderCursor", v:count)
    g:repeat#set("\<Plug>Markdown_EditUrlUnderCursor", v:count)
    g:is_repeat_installed_for_markdown = 1
endif

nmap <buffer> <LocalLeader>t <Plug>(md-headings-loclist)
