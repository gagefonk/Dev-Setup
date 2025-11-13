#!/bin/bash
set -e

#################################################################################################################################################
############################################################ Machine Setup ######################################################################
#################################################################################################################################################

# PW PROMPT
sudo -v

echo "Begining Machine Setup..."

# CONFIG DIRECTORIES
echo "Configuring directories..."

if -d ~/.config
then
    echo "Moving .config to .config.old"
    mv ~/.config ~/.config.old
fi

echo "Removing ~/.local/share/nvim"
rm -rf ~/.local/share/nvim

echo "Removing ~/.cache/nvim"
rm -rf ~/.cache/nvim

echo "Creating ~/.config/nvim"
mkdir -p ~/.config/nvim

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

# PACKAGES
PACKAGES=(
git
node
typescript
python
python3
go
deno
tmux
neovim
ripgrep
fd
rust
make
zsh-syntax-highlighting
zsh-autosuggestions
stylua
cmake
make
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
rectangle
visual-studio-code
spotify
discord
slack
docker
zen
obsidian
ghostty
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
font-jetbrains-mono-nerd-font
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

# CLEANUP BREW
echo "Cleaning up cellar"
brew cleanup

# NPM PACKAGES
echo "Installing some npm packages"
npm i -g prettier typescript javascript-typescript-langserver

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

# CONFIG FILES
echo "Installing configuration files..."
curl -L https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config/ --strip=2 Dev-Setup-master/.config/

# CREATE SIMLINKS
echo "Creating symlink for .zshrc"
ln -sf ~/.config/dotfiles/.zshrc ~/.zshrc

echo "Creating symlink for starship"
ln -sf ~/.config/dotfiles/starship.toml ~/.config/starship.toml

echo "Creating symlink for ghostty"
ln -sf ~/.config/dotfiles/ghostty/ ~/.config/ghostty/

