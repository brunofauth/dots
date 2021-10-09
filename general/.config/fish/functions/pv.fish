# Defined via `source`
function pv --wraps='pgrep' --description 'alias pv pgrep vim'
    pgrep vim $argv; 
end
