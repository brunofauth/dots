set root_dir $HOME/newmed/notas
set semester 8
set dirs (\
    find $root_dir/$semester -maxdepth 1 -type d -printf '%f\n' \
    | tail --lines +2)

complete --command note --no-files --condition "not __fish_seen_subcommand_from $dirs" --arguments "$dirs"

