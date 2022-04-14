function pqo --wraps='pacman -Qo'
  pacman --color always -Qo $argv;
end
