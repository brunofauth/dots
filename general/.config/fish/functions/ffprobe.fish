# Defined in - @ line 1
function ffprobe --wraps='ffprobe -hide_banner' --description 'alias ffprobe ffprobe -hide_banner'
 command ffprobe -hide_banner $argv;
end
