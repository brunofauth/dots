set ssids (nmcli --get-values SSID --color=no device wifi | xargs -rI {} echo "'{}'")
complete --command ezwifi --condition "not __fish_seen_subcommand_from $ssids" --arguments "$ssids"
complete --command ezwifi --no-files

