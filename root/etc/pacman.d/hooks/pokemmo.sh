#! /bin/sh

# this could be optimized to quit after the first substitution but I digress
sed -i 's|POKEMMO="$HOME/.pokemmo"|POKEMMO="$XDG_DATA_HOME/pokemmo"|' /usr/bin/pokemmo-launcher

