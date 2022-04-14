function cpb --wraps='rsync -aP' --description 'alias cpb rsync -aP'
  rsync -aP $argv; 
end
