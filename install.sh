#!/bin/sh
# rebuilds file structure
cd ~ || exit

ICLOUD=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs
list="archive code media other uni notes"
echo "$list" | tr ' ' '\n' | while read item; do
  ln -s "$ICLOUD"/root/$item $item
done

