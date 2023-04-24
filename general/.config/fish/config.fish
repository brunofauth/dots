if uname -a | grep -q microsoft
set -x WSL_ALIASES ~/.config/fish/wsl-aliases.fish
    test -f $WSL_ALIASES && source $WSL_ALIASES
end


function qaudio --description "I did this a long time ago and don't remember what it's for."
    set tmp $argv[2]
    if test -z $tmp; set tmp 1.5; end
    set thd $argv[3]
    if test -z $thd; set thd 2%; end
    sox "$argv[1]" "fast-$argv[1]" silence 1 0.1 $thd 1 0.1 $thd tempo $tmp : restart
end



# Fish specific configurations

set fish_greeting

if pstree -s $fish_pid | grep -q kitty
    kitty + complete setup fish | source
end

fish_default_key_bindings


# https://github.com/gazorby/fish-abbreviation-tips
# yss fish-abbreviation-tips

abbr pylint ruff
abbr dash rlwrap dash
abbr sh rlwrap dash
abbr dict dict "(read -P 'Word: ')"
abbr bim vim
abbr c cls
abbr ffmpeg ffmpeg -hide_banner
abbr ffprobe ffprobe -hide_banner
abbr ga git add
abbr gc git clone
abbr gcm "read -P 'Commit Message: ' | xargs -r git commit -m"
abbr gd git diff
abbr gp git push
abbr gs git status
abbr hn hugo new
abbr hs hugo server
abbr l ls
abbr lat ls -lAht
abbr lht ls -lht
abbr lhtr ls -lhtr
abbr mpv mpv --keep-open=yes
abbr musb usbeast -m
abbr pg pgrep -il
abbr pgff pgrep -il firefox
abbr pgp pass git push
abbr pgs pass git status
abbr pgv pgrep vim
abbr pi sudo pacman -S
abbr pqe "pacman -Qeq | fzf --preview-window=wrap --preview='env COLUMNS=9999 pacman -Qi {} | grep Description | cut -d: -f2-'"
abbr pqi pacman -Qi
abbr pql pacman -Ql
abbr pqo pacman -Qo
abbr pqs pacman -Qs
abbr psi pacman -Si
abbr pss pacman -Ss
abbr psyu sudo pacman -Syu
abbr pvt fish --private
abbr py ptpython
abbr pytohn python
abbr rf rm -rf
abbr rr rm -r
abbr sctl systemctl
abbr sctlu systemctl --user
abbr sof detach soffice
abbr touche touch
abbr um usbeast -m
abbr uu usbeast -u
abbr uusb usbeast -u
abbr vs vim -S Session.vim
abbr xo xdg-open
abbr yi yay --aur --noconfirm --removemake --sudoloop -S
abbr ysi yay --aur -Si
abbr yss yay --aur -Ss
abbr ysyu yay --aur --sudoloop -Syu
abbr zt zathura --fork

