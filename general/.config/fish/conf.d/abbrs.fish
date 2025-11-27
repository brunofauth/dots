if not status is-interactive
    return
end


abbr es snow ~/scripts
abbr ec snow ~/.config

abbr make make -j(nproc)
abbr dict dict "(read -P 'Word: ')"

abbr ffmpeg ffmpeg -hide_banner
abbr ffprobe ffprobe -hide_banner

abbr ga git add
abbr gc git clone "(read -P 'Repository URL: ')"
abbr gd git diff
abbr gs git status
abbr gcm git commit -m "(read -P 'Commit message: ')"
abbr gp git push
abbr gpull git pull
abbr gco git checkout

abbr gt gitui

abbr info info --vi-keys

abbr ll ls -lh
abbr l1 ls -1h
abbr la ls -Ah
abbr lht ls -lht
abbr lhtr ls -lhtr

abbr locate locate -i
abbr mkd mkdir -p
abbr mkt mktemp --tempdir

abbr ps sudo pacman -S
abbr pss pacman -Ss
abbr psi pacman -Si
abbr psyu sudo nice -n 10 pacman -Syu --noconfirm
abbr psyuw sudo nice -n 10 pacman -Syuw --noconfirm --disable-download-timeout
abbr pqi pacman -Qi
abbr pql pacman -Ql
abbr pqo pacman -Qo
abbr pqs pacman -Qs
abbr prns sudo pacman -Rns

abbr pg pgrep -i
abbr pgl pgrep -il
abbr pgv pgrep -il vim\\\$

abbr pgp pass git push
abbr pgs pass git status
abbr pgpull pass git pull

abbr pk pkill -i
abbr pke pkill -ie

abbr rf rm -rf
abbr rr rm -r

abbr sof soffice
abbr sxiv detach nsxiv -a

abbr bbl bbl "(read -P 'book and chapter: ' | string split ' ')" in ntlh

abbr ts tmux-sessions

abbr ys yay --aur --noconfirm --sudoloop -S
abbr ysi yay --aur -Si
abbr yss yay --aur -Ss
abbr ysyu yay --aur --sudoloop -Syu

abbr zt zathura --fork
