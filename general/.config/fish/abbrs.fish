abbr bim vim
abbr VIM vim
abbr pgv pgrep vim\\\$
abbr vs vim -S Session.vim

abbr c cls
abbr CLS cls
abbr CD cd

abbr pqe "pacman -Qeq | fzf --preview-window=wrap --preview='env COLUMNS=9999 pacman -Qi {} | grep Description | cut -d: -f2-'"
abbr pqi pacman -Qi
abbr pql pacman -Ql
abbr pqo pacman -Qo
abbr pqs pacman -Qs
abbr psi pacman -Si
abbr pss pacman -Ss
abbr psyu sudo nice -n 10 pacman -Syu --noconfirm
abbr psyuw sudo nice -n 10 pacman -Syuw --noconfirm --disable-download-timeout
abbr pi sudo pacman -S

abbr yi yay --aur --noconfirm --removemake --sudoloop -S
abbr ysi yay --aur -Si
abbr yss yay --aur -Ss
abbr ysyu yay --aur --sudoloop -Syu

abbr dash rlwrap --complete-filenames --case-insensitive dash
abbr dict dict "(read -P 'Word: ')"
abbr ff firefox
abbr ffmpeg ffmpeg -hide_banner
abbr ffprobe ffprobe -hide_banner
abbr ga git add
abbr gc git clone \(read -P "'Repo URL: '" \)
abbr gcm "read -P 'Commit Message: ' | xargs -rd '\n' git commit -m"
abbr gd git diff
abbr gp git push
abbr gs git status
abbr gt gitui
abbr hn hugo new
abbr hs hugo server
abbr info info --vi-keys
abbr kitty kitty --detach
abbr l ls
abbr ll ls -l
abbr l1 ls -1
abbr lat ls -lAht
abbr lht ls -lht
abbr lhtr ls -lhtr
abbr locate locate --ignore-case
abbr mandb sudo mandb
abbr mkd mkdir -p
abbr mkt mktemp --tempdir
abbr mpv detach mpv --keep-open=yes --save-position-on-quit
abbr npm pnpm
abbr pg pgrep -il
abbr pgff pgrep -il firefox
abbr pgp pass git push
abbr pgs pass git status
abbr pk pkill
abbr polybar detach polybar -c ~/.config/polybar/config.ini main
abbr pvt fish --private
abbr py ptpython
abbr pt ptpython
abbr pytohn python
abbr pylint ruff
abbr rf rm -rf
abbr rr rm -r
abbr sc shellcheck
abbr sctl systemctl
abbr sctlu systemctl --user
abbr sh rlwrap dash
abbr sof detach soffice
abbr sxiv detach sxiv -a
abbr touche touch
abbr updatedb sudo updatedb
abbr xo xdg-open
abbr zt zathura --fork

abbr um usbeast -m
abbr musb usbeast -m
abbr uu usbeast -u
abbr uusb usbeast -u

abbr bbl bbl "(read -P 'book and chapter: ' | string split ' ')" in ntlh
