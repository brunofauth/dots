# Defined in - @ line 1
function psyu --wraps=pacman --description 'alias psyu sudo pacman --color always -Syu'
    sudo pacman --color always -Syu $argv;
end
