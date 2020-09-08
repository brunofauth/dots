# Defined in - @ line 1
function ysi --wraps='yay -Si' --description 'alias ysi=yay -Si'
  yay --color always -Si $argv;
end
