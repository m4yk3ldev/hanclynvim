#!/bin/bash
# HanclyNvim installation script for Ubuntu/Debian
set -e

echo "======================================"
echo "  HanclyNvim Installation - Ubuntu"
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

# Install Neovim
echo ""
echo "📥 Installing Neovim..."
if ! command -v nvim &>/dev/null; then
  sudo snap install nvim --classic
  echo "✓ Neovim installed"
else
  echo "✓ Neovim already installed"
fi

# Install dependencies
echo ""
echo "📥 Installing dependencies..."
sudo apt update
sudo apt install -y \
  build-essential \
  curl \
  git \
  wget \
  unzip \
  python3-pip \
  python3-venv \
  fzf \
  xclip \
  ripgrep \
  fd-find \
  luarocks

echo "✓ Dependencies installed"

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
