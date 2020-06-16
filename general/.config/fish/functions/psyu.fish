# Defined in - @ line 1
function psyu --wraps='sudo pacman -Syu' --description 'alias psyu sudo pacman -Syu'
  sudo pacman -Syu $argv;
end
