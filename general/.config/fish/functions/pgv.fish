# Defined via `source`
function pgv --wraps='pgrep' --description 'alias pv pgrep vim'
    pgrep vim $argv; 
end
