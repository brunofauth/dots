# Defined in - @ line 1
function ysyu --wraps=yay --description 'alias ysyu yay --aur -Syu'
    yay --color always --aur -Syu $argv;
end
