#!/bin/bash

# Create config directory(s)
mkdir ~/.config
mkdir ~/.config/tmux

# HomeBrew
git clone https://github.com/Homebrew/brew /opt/homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"

# Install the Software

#iterm2
brew install --cask iterm2
#neovim
brew install neovim
#fish shell
brew install fish
#fish package manager
brew install fisher
#nerd font for fish (HACK)
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
#tide theme for fisher
fish <<'END_FISH'
	fisher install IlanCosman/tide@v5
END_FISH

# Download the config .dotfiles from git
#tmux
cd ~/.config/tmux && { curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/tmux.conf > tmux.conf; cd -; }
#fish
cd ~/.config/fish && { curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/config.fish > config.fish; cd -; }

