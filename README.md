# HanclyNvim

A modern Neovim configuration built on top of [LazyVim](https://www.lazyvim.org/).

## ✨ Features

- 🚀 Built on LazyVim for a solid foundation
- 🎨 Gruvbox colorscheme
- 🤖 GitHub Copilot & Copilot Chat integration
- 📦 Pre-configured for TypeScript, Python, Docker, Markdown, and more
- ⚡ Fast startup with lazy loading
- 🔧 Custom keymaps optimized for productivity

## 📋 Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, but recommended)
- For Arch Linux: run the provided installation script
- For Ubuntu: run the Ubuntu installation script

## 🚀 Installation

### Arch Linux

```bash
bash install_archlinux.sh
```

### Ubuntu

```bash
bash install_ubuntu.sh
```

### Manual Installation

1. Backup your current Neovim configuration:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

1. Clone this repository:

```bash
git clone https://github.com/m4yk3ldev/hanclynvim.git ~/.config/nvim
```

1. Start Neovim:

```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## 📚 Documentation

- [Keymaps Documentation](KEYMAP.md) - Complete list of custom keybindings
- [LazyVim Documentation](https://www.lazyvim.org/) - Official LazyVim docs
- [Changelog](CHANGELOG.md) - Version history and updates

## 🎯 Included Language Support

- TypeScript/JavaScript
- Python
- JSON
- Tailwind CSS
- Docker
- Markdown
- TOML

## 🤝 Credits

Based on [LazyVim](https://github.com/LazyVim/LazyVim) by [@folke](https://github.com/folke)

## 📝 License

[MIT License](LICENSE)
