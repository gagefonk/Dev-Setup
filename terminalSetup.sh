#!/bin/bash

### VARIABLES
needsBrewUpdate=false

### Functions

# Create Directory
# Create them only if they dont exist already.
createDirectories()
{
mkdir -p ~/.config
}

# Homebrew
# Install Homebrew
installHomebrew()
{
git clone https://github.com/Homebrew/brew /opt/homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"
}

# Homebrew Updates
homebrewUpdate()
{
if [ "$needsBrewUpdate" = true ]; then
brew update
fi
}

# Install/Update Iterm2
installIterm()
{
if brew ls --versions iterm2 > /dev/null; then
  brew install --cask iterm2
else
  # exists - queue update
  $needsBrewUpdate=true
fi
}

# Install OhMyZSH
installOhMyZSH()
{
if [ d- ~/.oh-my-zsh ]; then
# update it
omz update
else
# install it
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
}

# P10k Theme
installP10kTheme()
{
if brew ls --versions romkatv/powerlevel10k/powerlevel10k > /dev/null; then
  brew install romkatv/powerlevel10k/powerlevel10k
  echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
else
  $needsBrewUpdate=true
fi
}

# ZSH Plugins
# ZSH AutoCompletion
installAutoCompletion()
{
if brew ls --version zsh-autosuggestions > /dev/null; then
  brew install zsh-autosuggestions
else
  $needsBrewUpdate=true
fi
}

# ZSH Syntax Highlighting
installSyntaxHighlighting()
{
if brew ls --version zsh-syntax-highlighting > /dev/null; then
  brew install zsh-syntax-highlighting
else
  $needsBrewUpdate=true
fi
}

# Hack Nerd Font
installHackNerdFont()
{
if brew ls --version font-hack-nerd-font > /dev/null; then
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
else
  $needsBrewUpdate=true
fi
}

# NVIM
installNVIM()
{
if brew ls --version neovim > /dev/null; then
  brew install neovim
else
  $needsBrewUpdate=true
fi
}

# TMUX
installTmux()
{
if brew ls --version tmux > /dev/null; then
  brew install tmux
else
  $needsBrewUpdate=true
fi
}

# Install Config Files
installConfigs()
{
# Tmux
echo "pulling tmux config file"
curl -o ~/.tmux.conf https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/tmux.conf
# ZSHRC
echo "pulling ohmyzsh config file"
curl -o ~/.zshrc https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.zshrc
# P10K
echo "pulling p10k config file"
curl -o ~/.p10k.zsh https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.p10k.zsh
}




### SCRIPT

# Create Directories
createDirectories

# HomeBrew
installHomebrew

# Iterm
installIterm

# OhMyZSH
installOhMyZSH

# P10k Theme
installP10kTheme

# ZSH Plugins
# AutoCompletion
installAutoCompletion
# Syntax Highlighting
installSyntaxHighlighting

# Hack Nerd font
installHackNerdFont

# NVIM
installNVIM

# Tmux
installTmux

# Install Config Files
installConfigs

# Brew Updates
homebrewUpdate

# Source the ZSHRC file just incase
source ~/.zshrc
