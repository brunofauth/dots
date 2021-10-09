# Defined in - @ line 1
function pi --wraps=pacman --description 'alias pi sudo pacman --color always --noconfirm -S'
    sudo pacman --color always --noconfirm -S $argv;
end
