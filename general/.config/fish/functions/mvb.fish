function mvb --wraps='rsync -aP --remove-source-files' --description 'alias mvb rsync -aP --remove-source-files'
  rsync -aP --remove-source-files $argv; 
end
