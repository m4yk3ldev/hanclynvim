#!/bin/bash
set -e

repo="$(cd "$(dirname "$0")" && pwd)"
target="$HOME/.config/nvim"

# If a real directory already exists, back it up instead of nesting the symlink inside it
if [ -e "$target" ] && [ ! -L "$target" ]; then
  backup="$target.bak-$(date +%Y%m%d%H%M%S)"
  mv "$target" "$backup"
  echo "Existing config moved to $backup"
fi

ln -sfn "$repo" "$target"
echo "$target -> $repo"
