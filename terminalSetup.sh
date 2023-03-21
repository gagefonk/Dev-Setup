#!/bin/bash
set -e

#################################################################################################################################################
############################################################ Machine Setup ######################################################################
#################################################################################################################################################

# Prompt for PW
sudo -v

echo "Begining Machine Setup"

# Create Config Directories
mkdir -p ~/.config/nvim

# Install Homebrew
echo "Installing Homebrew"
echo "$USER_PASSWORD" | NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
node
typescript
python
python3
tmux
neovim
romkatv/powerlevel10k/powerlevel10k
zsh-syntax-highlighting
zsh-autosuggestions
)

echo "Installing packages..."
for package in "${PACKAGES[@]}"
do
  # Check if the package is already installed
  if brew list "$package" >/dev/null 2>&1; then
    echo "$package already installed."
  else
    # Install the package
    echo "Installing $package..."
    brew install "$package"
  fi
done

# Install Casks
CASKS=(
google-chrome
iterm2
rectangle
visual-studio-code
spotify
discord
)

echo "Installing casks..."
for cask in "${CAKS[@]}"
do
  # Check if the cask is already installed
  if brew cask list "$cask" >/dev/null 2>&1; then
    echo "$cask already installed."
  else
    # Install the cask
    echo "Installing $cask..."
    brew install --cask "$cask"
  fi
done

# Install Fonts
FONTS=(
font-hack-nerd-font
)

brew tap homebrew/cask-fonts
for font in "${FONTS[@]}"
do
  # Check if the cask is already installed
  if brew cask list "$font" >/dev/null 2>&1; then
    echo "$font already installed."
  else
    # Install the cask
    echo "Installing $cask..."
    brew install --cask "$font"
  fi
done

echo "Cleaning up..."
brew cleanup

# Install Packer
# LUA plugin manager for VIM
if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
  echo "Installing Packer..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Config files
echo "Installing configuration files..."
#curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/tmux.conf > ~/.tmux.conf
#curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.p10k.zsh > ~/.p10k.zsh
#curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.zshrc > ~/.zshrc
#curl https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config/ --strip=2 Dev-Setup-master/.config/nvim
curl https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config/

# Create SymLinks
ln -s ~/.tmux.conf ~/.config/dotfiles/tmux.conf
ls -s ~/.p10k.zsh ~/.config/dotfiles/.p10k.zsh
ls -s ~/.zshrc ~/.config/dotfiles/.zshrc

# Launch iTerm2
#open -a iTerm
echo "Finished setting up env"
