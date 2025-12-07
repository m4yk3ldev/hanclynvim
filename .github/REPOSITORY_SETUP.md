# GitHub Repository Setup

## Description

```
A modern Neovim configuration built on LazyVim with GitHub Copilot, TypeScript, Python, and more
```

## Topics (Tags)

Add these topics to your repository for better discoverability:

- `neovim`
- `lazyvim`
- `nvim`
- `vim`
- `neovim-config`
- `copilot`
- `typescript`
- `python`
- `gruvbox`
- `lua`
- `dotfiles`
- `editor`

## How to Update

### Option 1: Via GitHub Web Interface

1. Go to <https://github.com/m4yk3ldev/hanclynvim>
2. Click the ⚙️ (gear icon) next to "About" on the right side
3. Add the description above
4. Add the topics listed above
5. Click "Save changes"

### Option 2: Via GitHub CLI (if you have `gh` installed)

```bash
gh repo edit m4yk3ldev/hanclynvim \
  --description "A modern Neovim configuration built on LazyVim with GitHub Copilot, TypeScript, Python, and more" \
  --add-topic neovim \
  --add-topic lazyvim \
  --add-topic nvim \
  --add-topic vim \
  --add-topic neovim-config \
  --add-topic copilot \
  --add-topic typescript \
  --add-topic python \
  --add-topic gruvbox \
  --add-topic lua \
  --add-topic dotfiles \
  --add-topic editor
```

### Installing GitHub CLI (gh)

**Ubuntu:**

```bash
sudo apt install gh
```

**Arch Linux:**

```bash
sudo pacman -S github-cli
```

After installation, authenticate:

```bash
gh auth login
```
