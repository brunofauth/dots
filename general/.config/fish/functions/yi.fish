# Defined in - @ line 1
function yi --wraps=yay --description 'alias yi yay --aur --noconfirm --removemake --color always -S'
    yay --aur --noconfirm --removemake --color always -S $argv;
end
