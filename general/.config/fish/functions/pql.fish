# Defined in - @ line 1
function pql --wraps='pacman --color always -Ql' --description 'alias pql pacman --color always -Ql'
  pacman --color always -Ql $argv;
end
