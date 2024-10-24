vim9script


# :help getregion()
# :help getregtype()
var _translation_table: dict<string> = {char: "v", line: "V", block: ""}


# https://superuser.com/questions/380772/removing-ansi-color-codes-from-text-stream
# https://stackoverflow.com/questions/29426372/vim-regex-hex-character-in-replacement
def UnescapeString(_index: number, value: string): string
    return substitute(value, '\[[0-9;]*m', '', 'g')
enddef


# :help 'operatorfunc'
# The function is called with one String argument:
#     "line"	{motion} was |linewise|
#     "char"	{motion} was |characterwise|
#     "block"	{motion} was |blockwise-visual|
def YankUnescapedRegion(arg_type: string): void
    var sel_start = getpos("'<")
    var sel_end   = getpos("'>")
    var raw_lines = getregion(sel_start, sel_end, {type: _translation_table[arg_type]})
    var new_lines = raw_lines->map(UnescapeString)
    setreg(v:register, new_lines, _translation_table[arg_type])
enddef


def YankUnescapedWrapper(): string
    &operatorfunc = YankUnescapedRegion
    return 'g@'
enddef


noremap <expr> y YankUnescapedWrapper()

