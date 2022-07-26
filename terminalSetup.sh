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
#ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#powerlevel10k theme for ohmyzsh
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

####plugins

#zsh-autocompletions
brew install zsh-autosuggestions
#zsh syntax highlighting
brew install zsh-syntax-highlighting
#pull ohmyzsh config file
cd ~/ && { curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.zshrc > .zshrc }
#pull p10k config file
cd ~/ && { curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.p10k.zsh > .p10k.zsh }

#neovim
brew install neovim
#nerd font hack
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Download the config .dotfiles from git
#tmux
cd ~/.config/tmux/ && { curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/tmux.conf > tmux.conf }
