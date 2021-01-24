#!/bin/sh

cd ~ || exit

echo "ZDOTDIR=$HOME/.config/zsh" > ~/.zshenv

# set up soft links
ICLOUD=$HOME/Library/Mobile\ Documents/com~apple~CloudDocs
ln -s "$ICLOUD" .icloud

list="archive code media notes personal uni"
echo "$list" | tr ' ' '\n' | while read item; do
  ln -s ./.icloud/root/$item $item
done

# neovim plugins, quoting ruins the directory name
_dir=~/.local/share/nvim/site/pack/jason/opt
mkdir -p $_dir
if [ -z "`ls $_dir`" ]; then
    cd ~/.local/share/nvim/site/pack/jason/opt
    git clone https://github.com/jasoneveleth/vim-dim
    git clone https://github.com/tpope/vim-surround
    git clone https://github.com/tpope/vim-commentary
    cd ~
fi

brew install cask fzf htop mosh neofetch neovim nnn pyenv ripgrep shellcheck speedtest-cli tmux tree tree-sitter wget ctags direnv
brew cask install alacritty alfred appcleaner basictex discord fantastical gimp keycastr mailplane minecraft qlmarkdown qlstephen spotify tunnelblick zoomus

# set defaults
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.Dock showhidden -bool TRUE; killall Dock
defaults write com.apple.dock autohide-time-modifier -float 0; killall Dock
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 1
