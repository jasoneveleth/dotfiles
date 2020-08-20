#!/bin/sh
# rebuilds file structure
cd ~ || exit
ICLOUD=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs
list="archive code media other uni"

# # making symlinks
# ln -s "$ICLOUD"/root/archive archive
# ln -s "$ICLOUD"/root/code code
# ln -s "$ICLOUD"/root/media media
# ln -s "$ICLOUD"/root/other other
# ln -s "$ICLOUD"/root/uni uni

# to get vim plugged
# curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
#         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# get config folder
# git clone https://github.com/jasoneveleth/dotfiles.git ~/.config

echo "$list" | tr ' ' '\n' | while read item; do
  ln -s "$ICLOUD"/root/$item $item
done

