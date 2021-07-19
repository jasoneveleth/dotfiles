#!/bin/sh

cd ~ || exit

brew install bat cask cloc coreutils diff-so-fancy exa fd ffmpeg fzf graphviz htop imagemagick ipython libsvg moreutils mosh neofetch neovim nnn pandoc pv ripgrep shellcheck speedtest-cli stow tmux trash tree
brew install --cask alacritty alfred appcleaner basictex discord fantastical flux font-hack gimp julia keycastr kitty minecraft osxfuse qlmarkdown qlstephen skim spotify tunnelblick zoom tinkertools imageoptim
# fonts: https://corgibytes.com/blog/2020/01/29/install-fonts-on-your-mac-from-the-command-line-with-homebrew/
# brew install mailplane
# brew tap zegervdv/zathura
# brew install zathura-pdf-mupdf
# might need to install mupdf

echo "ZDOTDIR=$HOME/.config/zsh" | sudo tee /etc/zshenv

# set up soft links
ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
ln -s ~/Documents .icloud

list="dev notes"
echo "$list" | tr ' ' '\n' | while read item; do
  ln -s ./.icloud/$item $item
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
killall SystemUIServer

# sudo tlmgr install stackengine titlesec titling siunitx latexmk biber xypic enumitem footmisc courier lastpage

# edit /etc/profile and /etc/zprofile to not run path_helper which fucks up the path. one is run with `zsh -l` the other with `zsh`. use `-o sourcetrace` to figure out which file

# ```
#  DIFF: for provider
# diff --git a/runtime/autoload/provider.vim b/runtime/autoload/provider.vim
# index dc24e801d..754f1cc79 100644
# --- a/runtime/autoload/provider.vim
# +++ b/runtime/autoload/provider.vim
# @@ -4,18 +4,25 @@
#  "
#  " Returns a valid channel on success
#  function! provider#Poll(argv, orig_name, log_env) abort
# -  let job = {'rpc': v:true, 'stderr_buffered': v:true}
# +  let job = {'rpc': v:true, 'stderr_buffered': v:true, 'on_stderr': funcref('s:OnError')}
#    try
#      let channel_id = jobstart(a:argv, job)
# -    if channel_id > 0 && rpcrequest(channel_id, 'poll') ==# 'ok'
# +    if channel_id > 0
#        return channel_id
#      endif
#    catch
#      echomsg v:throwpoint
#      echomsg v:exception
# -    for row in get(job, 'stderr', [])
# -      echomsg row
# -    endfor
#    endtry
#    throw remote#host#LoadErrorForHost(a:orig_name, a:log_env)
#  endfunction
# +
# +function! s:OnError(id, data, event)
# +  if !empty(a:data)
# +    echohl Error
# +    for row in a:data
# +      echomsg row
# +    endfor
# +    echohl None
# +  endif
# +endfunction
# ```
