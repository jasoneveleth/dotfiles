#!/bin/sh
# rebuilds file structure
cd ~ || exit

echo "ZDOTDIR=$HOME/.config/zsh" > ~/.zshenv

ICLOUD=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs
ln -s "$ICLOUD" .icloud

list="archive code media notes personal uni"
echo "$list" | tr ' ' '\n' | while read item; do
  ln -s ./.icloud/root/$item $item
done

# neovim plugins
mkdir -p ~/.local/share/nvim/site/pack/jason/opt
cd ~/.local/share/nvim/site/pack/jason/opt
git clone https://github.com/jasoneveleth/vim-dim
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-commentary

# make brew play nice with pyenv
