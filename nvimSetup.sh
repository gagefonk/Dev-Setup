#!/bin/bash

echo "Setting up NVIM"

# CONFIG DIRECTORIES
echo "Configuring directories..."

echo "Removing ~/.config/nvim"
rm -rf ~/.config/nvim

echo "Removing ~/.local/share/nvim"
rm -rf ~/.local/share/nvim

echo "Removing ~/.cache/nvim"
rm -rf ~/.cache/nvim

echo "Creating ~/.config/nvim"
mkdir -p ~/.config/nvim

# INSTALL NVIM
echo "Installing nvim files..."
curl https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master | tar -xz -C ~/.config --strip=2 Dev-Setup-master/.config/nvim