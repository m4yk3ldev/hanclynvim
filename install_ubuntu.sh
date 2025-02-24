#!/bin/bash
# Copiar los archivos en el $HOME
set -ex

echo "Instalando NVIM"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt install neovim fzf xclip ripgrep luarocks
