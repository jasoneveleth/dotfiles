#!/bin/sh
# rebuilds file structure
cd ~ || exit

echo "ZDOTDIR=$HOME/.config/zsh" > ~/.zshenv

ICLOUD=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs
list="archive code media other uni notes"
echo "$list" | tr ' ' '\n' | while read item; do
  ln -s "$ICLOUD"/root/$item $item
done

# neovim plugins
mkdir -p ~/.local/share/nvim/site/pack/jason/opt
cd ~/.local/share/nvim/site/pack/jason/opt
git clone https://github.com/jasoneveleth/vim-dim
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-commentary

