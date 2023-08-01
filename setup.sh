#!/bin/sh

cd ~ || exit

# folders which we will put stuff in that should come back into dotfiles directory
mkdir -p ~/.config/nvim/pack/minpac
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/{zsh,misc}
mkdir -p ~/.config/julia

(cd ~/dotfiles/src && make)

dirs="$(ls -d */ | tr '\n' ' ')"
# denylist for folders to stow
dirs="${dirs//src /}"

# -v verbose
# -S stow
# -t ~ target home directory
stow -vS $dirs

mkdir -p ~/.config/nvim/pack/minpac/opt/minpac
git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac

brew tap homebrew/cask-fonts 
brew tap corgibytes/cask-fonts
brew install bat cask cloc coreutils diff-so-fancy exa fd ffmpeg fzf graphviz htop imagemagick ipython libsvg moreutils mosh neofetch neovim nnn pandoc pv ripgrep shellcheck speedtest-cli stow tmux trash tree bluetoothconnector dvipng gron git-delta
brew install poppler # this gets pdftotext
brew install --cask alacritty alfred appcleaner mactex-no-gui discord fantastical flux font-hack gimp julia keycastr kitty minecraft osxfuse qlmarkdown qlstephen skim spotify tunnelblick zoom tinkertools imageoptim stats

echo "ZDOTDIR=$HOME/.config/zsh" | sudo tee /etc/zshenv

# set up soft links
ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ln -s ~/Documents .root

list="dev notes"
echo "$list" | tr ' ' '\n' | while read item; do
  ln -s ./.root/$item $item
done

# set defaults
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.Dock showhidden -bool TRUE; killall Dock
defaults write com.apple.dock autohide-time-modifier -float 0; killall Dock
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 1
defaults write com.apple.screencapture "include-date" 0
defaults write com.apple.screencapture name "ss"
defaults write com.apple.screencapture location ~/Downloads
defaults write com.apple.dock workspaces-auto-swoosh -bool NO
killall Dock
killall SystemUIServer

# this is for Neovide to find the `nvim` binary
sudo launchctl config user path "$(brew --prefix)/bin:${PATH}"

cat <<EOF
path
====

edit /etc/profile and /etc/zprofile to not run path_helper which fucks up the
path. one is run with `zsh -l` the other with `zsh`. use `-o sourcetrace` to
figure out which file


change caps lock to escape
==========================

from: https://hidutil-generator.netlify.app
~/Library/LaunchAgents/com.local.KeyRemapping.plist
EOF

# sudo tlmgr install stackengine titlesec titling siunitx latexmk biber xypic enumitem footmisc courier lastpage standalone doublestroke preview relsize calligra nopageno

# chane nnn to be like this: (this removes the highlight for the '+')
#	// addch((ent->flags & FILE_SELECTED) ? '+' | A_REVERSE | A_BOLD : ' ');
#	addch((ent->flags & FILE_SELECTED) ? '+' | A_BOLD : ' ');

# sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

