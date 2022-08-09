#!/bin/bash
set -e
###################################################################################################
##################################### Machine Setup ###############################################
###################################################################################################

echo "Begining Machine Setup"

# Create Config Directory
mkdir -p ~/.config
mkdir -p ~/.config/nvim

# Install Homebrew
echo "Installing Homebrew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

# Install OHMYZSH - Silently
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing OHMYZSH..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Packages
PACKAGES=(
git
npm
python
python3
tmux
neovim
romkatv/powerlevel10k/powerlevel10k
zsh-syntax-highlighting
zsh-autosuggestions
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

# Install Casks
CASKS=(
iterm2
)

echo "Installing casks..."
brew install --cask ${CASKS[@]}

# Install Fonts
FONTS=(
font-hack-nerd-font
)

brew tap homebrew/cask-fonts
brew install --cask ${FONTS[@]}

# Install Packer
# LUA plugin manager for VIM
if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
  echo "Installing Packer..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Config files
echo "Installing configuration files..."
curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/tmux.conf > ~/.tmux.conf
curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.p10k.zsh > ~/.p10k.zsh
curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.zshrc > ~/.zshrc
curl https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config/ --strip=2 Dev-Setup-master/.config/nvim
