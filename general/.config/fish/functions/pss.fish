# Defined in - @ line 1
function pss --wraps=pacman --description 'alias pss pacman -Ss'
    pacman --color always -Ss $argv;
end
