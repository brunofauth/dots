# Defined in - @ line 1
function yss --wraps='yay --aur --color always -Ss' --description 'alias yss yay --aur --color always -Ss'
  yay --aur --color always -Ss $argv;
end
