#!/bin/bash
# Copiar los archivos en el $HOME
set -ex

echo "Instalando NVIM"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim  fzf xclip ripgrep  luarocks
