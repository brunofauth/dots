vim9script


# :gelp :UltiSnipsEdit
g:UltiSnipsEditSplit = "context"
g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = g:vimrc_home_dir .. "/ultisnips"

# :help UltiSnips-how-snippets-are-loaded
g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips"]

# search for directories named 'snippets' while looking for SnipMate snippets
g:UltiSnipsEnableSnipMate = false

# UltiSnips-trigger-key-mappings
g:UltiSnipsExpandTrigger       = '<tab>'
g:UltiSnipsListSnippets        = ''
g:UltiSnipsJumpForwardTrigger  = '<c-j>'
g:UltiSnipsJumpBackwardTrigger = '<c-k>'
