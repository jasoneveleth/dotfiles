#!/bin/sh

cd ~ || exit

# echo "ZDOTDIR=$HOME/.config/zsh" into beginning of /etc/zshrc

# set up soft links
ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ln -s ~/Documents .icloud
# ln -s "$ICLOUD" .icloud

list="archive code media notes personal uni"
echo "$list" | tr ' ' '\n' | while read item; do
  ln -s ./.icloud/root/$item $item
done

# neovim plugins, quoting ruins the directory name
# _dir=~/.config/nvim/pack/jason/opt
# mkdir -p $_dir
# if [ -z "`ls $_dir`" ]; then
#     cd $_dir
#     plugins="jasoneveleth/vim-dim tpope/vim-surround tpope/vim-commentary"
#     echo "$plugins" | tr ' ' '\n' | while read item; do
#         git clone https://github.com/$item
#     done
#     cd ~
# fi

brew install bat cask ctags direnv fd fzf graphviz htop jump moreutils mosh neofetch neovim nnn pyenv pypy3 ripgrep shellcheck speedtest-cli tmux tree
brew cask install alacritty alfred appcleaner basictex discord fantastical gimp google-chrome julia keycastr minecraft osxfuse qlmarkdown qlstephen spotify tunnelblick zoom

# brew install mailplane
# brew tap zegervdv/zathura
# brew install zathura-pdf-mupdf
# might need to install mupdf

# set defaults
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.Dock showhidden -bool TRUE; killall Dock
defaults write com.apple.dock autohide-time-modifier -float 0; killall Dock
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 1

# sudo tlmgr install stackengine titlesec titling siunitx latexmk biber xypic enumitem footmisc
# alias brew="/usr/bin/env PATH=${PATH/$PYENV_ROOT\/shims:/} /usr/local/bin/brew" # make brew and pyenv play nice
