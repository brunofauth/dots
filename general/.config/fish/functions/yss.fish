# Defined in - @ line 1
function yss --wraps=yay --description 'alias yss yay --aur --color always -Ss'
    yay --aur --color always -Ss $argv;
end
