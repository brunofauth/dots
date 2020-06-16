# Defined in - @ line 1
function pi --wraps='sudo pacman --noconfirm -S' --description 'alias pi sudo pacman --noconfirm -S'
  sudo pacman --noconfirm -S $argv;
end
