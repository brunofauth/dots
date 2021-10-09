# Defined via `source`
function pg --wraps=pgrep --description 'alias pg pgrep -il'
    pgrep -il $argv; 
end

