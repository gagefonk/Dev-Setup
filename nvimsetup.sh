
#!/bin/bash
set -e

echo "Testing Neovim config installation..."

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$CONFIG_DIR/dotfiles"
NVIM_SOURCE="$DOTFILES_DIR/nvim"
NVIM_TARGET="$CONFIG_DIR/nvim"
REPO_URL="https://codeload.github.com/gagefonk/Dev-Setup/tar.gz/master"

# Ensure ~/.config exists
mkdir -p "$CONFIG_DIR"

# Ensure parent directories for dotfiles exist
mkdir -p "$DOTFILES_DIR"

# Remove existing nvim folder in dotfiles (if any)
if [ -d "$NVIM_SOURCE" ]; then
    echo "Removing existing $NVIM_SOURCE"
    rm -rf "$NVIM_SOURCE"
fi

# Download nvim folder from your dotfiles repo
echo "Downloading nvim config..."
curl -L "$REPO_URL" | tar -xz -C "$DOTFILES_DIR" --strip=3 Dev-Setup-master/.config/dotfiles/nvim

# Remove existing target symlink/folder
if [ -e "$NVIM_TARGET" ] || [ -L "$NVIM_TARGET" ]; then
    rm -rf "$NVIM_TARGET"
fi

# Create symlink
echo "Creating symlink $NVIM_TARGET -> $NVIM_SOURCE"
ln -s "$NVIM_SOURCE" "$NVIM_TARGET"

# Run Neovim headless to sync plugins
if command -v nvim >/dev/null 2>&1; then
    echo "Running Neovim headless to sync plugins..."
    nvim --headless -c 'Lazy sync' -c 'quitall'
else
    echo "Neovim not installed, skipping Lazy.nvim sync."
fi

echo "Neovim config setup complete!"
