#!/bin/bash
set -e

#################################################################################################################################################
############################################################ Machine Setup ######################################################################
#################################################################################################################################################

# PW PROMPT
sudo -v

echo "Begining Machine Setup..."

# CONFIG DIRECTORIES
echo "Removing config files and directories..."
if [ -d ~/.config ]; then
  rm -r ~/.config
else
  echo ".config directory not found"
fi

rm ~/.p10k.zsh
echo "Creating Directories..."
mkdir -p ~/.config/nvim

# CONFIG FILES
echo "Creating placeholder config files for symlinks..."
touch ~/.p10k.zsh

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
else
    echo "OHMYZSH already installed."
fi

# P10k THEME
if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "P10k theme already installed."
fi

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
ripgrep
rust
make
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

# GIT IGNORE
echo "Removing .gitignore_global"
if [ -f ~/.gitignore_global ]; then
  rm ~/.gitignore_global
else
  echo ".gitignore_global not found"
fi

# GIT IGNORE GLOBAL
echo "Creating gitignore_global"
touch ~/.gitignore_global

# CONFIGURE GITIGNORE_GLOBAL
echo "Configuring gitignore_global"
echo .DS_Store >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# PACKER
# LUA plugin manager for VIM
if [ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
  echo "Installing Packer..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# CONFIG FILES
echo "Installing configuration files..."
curl https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config/ --strip=2 Dev-Setup-master/.config/

# SYMLINKS
echo "Creating Symlinks"
ln -sf ~/.config/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.config/dotfiles/.zshrc ~/.zshrc

# Import iterm settings
defaults import com.googlecode.iterm2 ~/.config/iterm2/com.googlecode.iterm2.plist

#NVIM

ENABLE_LUNARVIM=true

if [ $ENABLE_LUNARVIM = true ]; then
  # have to uninstall tree-sitter because of all the errors?
  brew uninstall --ignore-dependencies tree-sitter
  # removing the nvim folder
  rm -r ~/.config/nvim
  echo "Setting up LunarVim..."
  # Set the LunarVim branch and NeoVim version
  LV_BRANCH='release-1.2/neovim-0.8'

  # Download and run the LunarVim installer
  curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/$LV_BRANCH/utils/installer/install.sh | bash -s -- -y

else
  #echo "Setting up NVIM..."
  nvim -c "luafile ~/.config/nvim/lua/scripts/packer-mason.lua"
  echo "Installation complete, please close terminal/iterm2 and relaunch iterm"
fi

