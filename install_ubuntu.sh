#!/bin/bash
# Copiar los archivos en el $HOME
set -ex

echo "Instalando NVIM"
sudo snap install nvim --classic
echo "Instalando dependencias"
sudo apt update
sudo apt install -y build-essential curl git wget unzip python3-pip fzf xclip ripgrep luarocks