#!/bin/bash

# Prompt for sudo password
read -sp "Enter your sudo password: " sudo_password
echo $sudo_password | sudo -S echo "Thanks!"

# Create necessary directories
mkdir -p ~/.config/nvim

# Install Homebrew silently
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null

# Install Oh My Zsh silently if it doesn't exist
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Define Homebrew packages and install if they don't exist
brew_packages=(git npm python tmux neovim romkatv/powerlevel10k/powerlevel10k zsh-syntax-highlighting zsh-autosuggestions)
for package in "${brew_packages[@]}"; do
    if ! brew list -1 | grep -q "^$package\$"; then
        echo "Installing $package"
        echo $sudo_password | brew install $package
    fi
done

# Define Homebrew casks and install if they don't exist
brew_casks=(iterm2 rectangle visual-studio-code spotify discord)
for cask in "${brew_casks[@]}"; do
    if ! brew list -1 --cask | grep -q "^$cask\$"; then
        echo "Installing $cask"
        echo $sudo_password | brew install --cask $cask
    fi
done

# Define fonts and install if they don't exist
brew_fonts=(font-hack-nerd-font)
for font in "${brew_fonts[@]}"; do
    if ! brew list -1 | grep -q "^$font\$"; then
        echo "Installing $font"
        echo $sudo_password | brew install $font
    fi
done

# Clean up Homebrew
echo "Cleaning up Homebrew..."
echo $sudo_password | brew cleanup

# Install NVim packer
echo "Installing NVim packer..."
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install configuration files
echo "Installing configuration files..."
curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/tmux.conf > ~/.tmux.conf
curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.p10k.zsh > ~/.p10k.zsh
curl https://raw.githubusercontent.com/gagefonk/Dev-Setup/master/.zshrc > ~/.zshrc
curl https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config/ --strip=2 Dev-Setup-master/.config/nvim

# Launch iTerm2 and set the default shell to zsh
echo "Launching iTerm2..."
open -a iTerm
sleep 2
echo $sudo_password | chsh -s /bin/zsh

# Launch Zsh
echo "Launching Zsh..."
zsh
