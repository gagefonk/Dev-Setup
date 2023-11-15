#!/bin/bash
set -e

# PW PROMPT
sudo -v

echo "Setting up NVIM"

# CONFIG DIRECTORIES
echo "Configuring directories..."

nvimpath=~/.config/nvim
if [ -d "$nvimpath" ]; then
    if [ -d ~/.config/nvim.bak ]; then
        echo "Removing existing nvim.bak directory"
        rm -rf ~/.config/nvim.bak
    fi
    
    echo "Creating backup of $nvimpath"
    mv -f ~/.config/nvim ~/.config/nvim.bak
fi

echo "Removing ~/.local/share/nvim"
rm -rf ~/.local/share/nvim

echo "Removing ~/.cache/nvim"
rm -rf ~/.cache/nvim

echo "Creating ~/.config/nvim"
mkdir -p ~/.config/nvim

# INSTALL NVIM
echo "Installing nvim files..."
# curl -L https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config/ --strip=2 Dev-Setup-master/.config/nvim
cp -r  ~/Developer/Dev-Setup/.config/nvim ~/.config/
#run vim
nvim