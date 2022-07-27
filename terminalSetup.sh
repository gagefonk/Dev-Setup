#!/bin/bash
set -e
###################################################################################################
##################################### Machine Setup ###############################################
###################################################################################################

echo "Begging Machine Setup"

# Create Config Directory
mkdir -p ~/.config

# Install Homebrew
echo "Installing Homebrew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

# Install OHMYZSH - Silently
echo "Installing OHMYZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

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

# Config files
echo "Installing configuration files..."
curl ~/.tmux.conf https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/tmux.conf > ~/.tmux.conf
curl ~/.p10k.zsh https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.p10k.zsh > ~/.p10k.zsh
curl ~/.zshrc https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.zshrc > ~/.zshrc

exit 0
