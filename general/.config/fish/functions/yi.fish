# Defined in - @ line 1
function yi --wraps='yay -S' --description 'alias yi yay -S'
  yay --color always -S $argv;
end
