
#!/bin/bash
# Copiar los archivos en el $HOME
set -ex
echo "Enviando enlace  a .nvim"
ln -sfv $PWD $HOME/.config/nvim
