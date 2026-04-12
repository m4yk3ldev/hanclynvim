# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository overview

HanclyNvim is a personal Neovim distribution built on top of [LazyVim](https://www.lazyvim.org/). The repository is meant to be symlinked (or cloned) into `~/.config/nvim` and loaded by Neovim at startup.

- `init.lua` is the entrypoint — it just bootstraps `lua/config/lazy.lua`.
- `lua/config/` holds LazyVim core config (`lazy.lua`, `options.lua`, `keymaps.lua`, `autocmds.lua`).
- `lua/plugins/` holds user plugin specs that extend/override LazyVim (colorscheme, UI, dev tooling, etc.). Files here are auto-imported via the `{ import = "plugins" }` line in `lua/config/lazy.lua`.
- `config.sh` symlinks the repo into `~/.config/nvim`. `install_archlinux.sh` / `install_ubuntu.sh` install system dependencies.

## Architecture notes

This is **not** a standalone Lua project — it's a LazyVim spec tree. Plugin management flows through `lua/config/lazy.lua`, which:

1. Imports the full `lazyvim.plugins` set with `colorscheme = "gruvbox"`.
2. Enables a curated list of LazyVim `extras` (language support: typescript, python, json, tailwind, docker, markdown, sql, angular, cmake, toml, yaml, rust; linting: eslint; UI: mini-animate, mini-indentscope, smear-cursor, treesitter-context; AI: claudecode; util: mini-hipatterns, rest).
3. Imports the user `plugins/` directory last so local specs can override LazyVim defaults.
4. Sets `defaults = { lazy = false, version = false }` — plugins load eagerly by default here, unlike upstream LazyVim.

When adding a new plugin, create a new file under `lua/plugins/` returning a Lazy spec table; do **not** edit `lazy.lua` unless you're toggling a LazyVim extra.

## Common commands

Formatting Lua with Stylua (config in `stylua.toml`: 2-space indent, 120 col):

```bash
stylua lua/
```

Symlink the repo as the active Neovim config:

```bash
bash config.sh
```

Inside Neovim, the usual Lazy commands apply: `:Lazy`, `:Lazy sync`, `:Lazy update`, `:Lazy check`, `:LazyHealth`, `:checkhealth`. `checker.enabled = true` means Lazy auto-checks for plugin updates in the background.

There is no test suite or build step — changes are validated by launching `nvim` and exercising the config.
