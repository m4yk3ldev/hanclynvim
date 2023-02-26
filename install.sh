#!/bin/bash
# Copiar los archivos en el $HOME
set -ex

echo "Instalando NVIM"
sudo pacman -S neovim python-neovim fzf xclip ripgrep fd luarocks

echo "Enviando enlace  a .nvim"
ln -sfv $PWD $HOME/.config/nvim
