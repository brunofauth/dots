function psi --wraps='pacman -Si' --description 'alias psi pacman -Si'
  pacman -Si $argv; 
end
