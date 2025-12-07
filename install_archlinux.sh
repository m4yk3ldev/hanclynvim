#!/bin/bash
# HanclyNvim installation script for Arch Linux
set -e

echo "======================================"
echo "  HanclyNvim Installation - Arch"
echo "======================================"
echo ""

# Backup existing Neovim configuration
if [ -d "$HOME/.config/nvim" ]; then
    echo "📦 Backing up existing Neovim configuration..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo "✓ Backup created"
fi

if [ -d "$HOME/.local/share/nvim" ]; then
    echo "📦 Backing up existing Neovim data..."
    mv "$HOME/.local/share/nvim" "$HOME/.local/share/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo "✓ Backup created"
fi

# Install Neovim and dependencies
echo ""
echo "📥 Installing Neovim and dependencies..."
sudo pacman -S --needed --noconfirm \
    neovim \
    python-neovim \
    python-pip \
    nodejs \
    npm \
    git \
    curl \
    wget \
    unzip \
    fzf \
    xclip \
    ripgrep \
    fd \
    luarocks

echo "✓ Packages installed"

# Clone HanclyNvim configuration
echo ""
echo "📥 Cloning HanclyNvim configuration..."
git clone https://github.com/m4yk3ldev/hanclynvim.git "$HOME/.config/nvim"
echo "✓ Configuration cloned"

echo ""
echo "======================================"
echo "  ✓ Installation Complete!"
echo "======================================"
echo ""
echo "Run 'nvim' to start Neovim and let Lazy.nvim install plugins."
echo "On first launch, plugins will be automatically installed."
echo ""
