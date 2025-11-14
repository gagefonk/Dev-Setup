
#!/bin/bash
set -e

echo "Testing Neovim config installation..."

NVIM_DIR="$HOME/.config/nvim"
DOTFILES="$HOME/.config/dotfiles"
REPO_URL="https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master"

# Clean any previous tmp
rm -rf "$DOTFILES_TMP"

# Remove existing nvim config
if [ -d "$NVIM_DIR" ]; then
    echo "Removing existing ~/.config/nvim"
    rm -rf "$NVIM_DIR"
fi

# Download repo (only extracting .config/dotfiles/nvim)
echo "Downloading nvim config..."
mkdir -p "$DOTFILES_TMP"
curl -L "$REPO_URL" | tar -xz -C "$DOTFILES_TMP" --strip=3 Dev-Setup-master/.config/dotfiles/nvim

# Create symlink
echo "Creating symlink ~/.config/nvim -> ~/.config/tmp_nvim_download/nvim"
ln -s "$DOTFILES_TMP/nvim" "$NVIM_DIR"

# Run Neovim headless to sync plugins
echo "Running Neovim headless to sync plugins..."
nvim --headless -c 'Lazy sync' -c 'quitall'

echo "Neovim config setup and plugin sync complete!"
