#!/bin/bash
set -e

#################################################################################################################################################
############################################################ Machine Setup ######################################################################
#################################################################################################################################################

# PW PROMPT
sudo -v

echo "Begining Machine Setup"

# CONFIG DIRECTORIES
echo "Creating Directories"
mkdir -p ~/.config/nvim

# CONFIG FILES
echo "Creating placeholder configfiles for symlinks"
if [ ! -f ~/tmux.conf ]; then
    touch ~/tmux.conf
fi

if [ ! -f ~/.p10k.zsh ]; then
    touch ~/.p10k.zsh
fi

# HOMEBREW
if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew"
    echo "$USER_PASSWORD" | NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)
else
    echo "Homebrew is already installed."
fi

# OHMYZSH
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing OHMYZSH..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# P10k THEME
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# PACKAGES
PACKAGES=(
git
npm
node
typescript
python
python3
tmux
neovim
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

# CASKS
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
  if brew info "$cask" >/dev/null 2>&1; then
    echo "$cask already installed."
  else
    # Install the cask
    echo "Installing $cask..."
    brew install --cask "$cask"
  fi
done

# FONTS
FONTS=(
font-hack-nerd-font
)

brew tap homebrew/cask-fonts
for font in "${FONTS[@]}"
do
  # Check if the cask is already installed
  if brew cask info "$font" >/dev/null 2>&1; then
    echo "$font already installed."
  else
    # Install the cask
    echo "Installing $font..."
    brew install --cask "$font"
  fi
done

echo "Cleaning up..."
brew cleanup

# PACKER
# LUA plugin manager for VIM
if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
  echo "Installing Packer..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# CONFIG FILES
echo "Installing configuration files..."
curl https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config/ --strip=2 Dev-Setup-master/.config/

# CSYMLINKS
echo "Creating Symlinks"
ln -sf ~/.config/dotfiles/tmux.conf ~/tmux.conf
ln -sf ~/.config/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.config/dotfiles/.zshrc ~/.zshrc

# PACKER PLUGINS
echo "Installing Packer Plugins"
nvim +:PackerInstall
nvim +echo "$USER_PASSWORD"
