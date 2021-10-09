# Defined in - @ line 1
function ffmpeg --wraps=ffmpeg --description 'alias ffmpeg=ffmpeg -hide_banner'
    command ffmpeg -hide_banner $argv;
end
