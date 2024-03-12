vim9script

def BulletListToInline(start: number, stop: number, separator: string = "; ")
    :'<,'>substitute /\n^\(\s*\)\?\([-*]\|[0-9]\+\.\)\s\(\S\)/\3; /
    # const Substitute = function("substitute", [pattern, 'bababab', ''])
    # var input_lines = getline(start, stop)
    # echo match(input_lines, pattern)
    # const inline_list = map(input_lines, (_, v) => v->Substitute() )
    # # const inline_list = join(map(input_lines, 'substitute(v:val, "' .. pattern .. '", "\3", "")'), "; ")
    # setline(start, inline_list)
    # deletebufline(bufname(), start, stop)
    # append(start - 1, inline_list)
enddef

command -range=% BulletListToInline call BulletListToInline(<line1>, <line2>)

           bbaacc
