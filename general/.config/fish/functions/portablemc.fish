function portablemc
    set -l launcher_home $XDG_DATA_HOME/portablemc
    set -l work_dir (find $launcher_home/work-dirs -mindepth 1 -maxdepth 1 | fzf)
    if test -z $work_dir
        echo "No work-dir selected. Exiting." >&2 
        return 1
    end

    $HOME/.local/bin/portablemc \
        --main-dir=$launcher_home/main \
        --work-dir=$work_dir \
        $argv
end
