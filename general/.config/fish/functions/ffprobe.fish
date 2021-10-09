# Defined in - @ line 1
function ffprobe --wraps=ffprobe --description 'alias ffprobe ffprobe -hide_banner'
    command ffprobe -hide_banner $argv;
end
