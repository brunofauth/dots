if not status is-interactive
    return
end


function psyu
    sudo sh -c '\
        pacman -Sy || exit 1; \
        upd_pkgs="$(pacman -Qu)"; \
        [ -n "$upd_pkgs" ] || exit 0; \
        if echo "$upd_pkgs" | grep -q archlinux-keyring; then pacman -S archlinux-keyring --noconfirm; fi; \
        nice -n 10 pacman -Su --noconfirm\
    '
end
