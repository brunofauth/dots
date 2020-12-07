# Defined in - @ line 1
function pqo --wraps='pacman --color always -Qo' --description 'alias pqo pacman --color always -Qo'
  pacman --color always -Qo $argv;
end
