# Configuración de Neovim

Este documento describe la configuración de Neovim utilizada, incluyendo los mapeos de teclas y ajustes personalizados.

## Configuración de LazyVim

Este archivo es cargado automáticamente por `lazyvim.config.init`.

```lua
-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = LazyVim.safe_keymap_set
```

### Mejor navegación vertical
```lua
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
```

### Movimiento entre ventanas con `<Ctrl> + hjkl`
```lua
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
```

### Atajos adicionales
```lua
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)

-- Divider screen
keymap.set("n", "<leader>v", ":vsplit<CR>", opts)

-- ForceWrite
keymap.set("n", "<C-s>", "<cmd>w!<CR>", opts)

-- ForceQuit
keymap.set("n", "<C-q>", "<cmd>q!<CR>", opts)

-- Duplicate Line
keymap.set("n", "tt", ":t.<CR>", opts)

-- Seleccionar todo
keymap.set("n", "<C-a>", "ggVG", opts)

-- ToggleTerm
keymap.set("n", "<F2>", "<cmd>ToggleTerm<cr>", opts)

-- Recargar las configuraciones
keymap.set("n", "<C-R>", "<cmd>lua reload_nvim_conf()<CR>", opts)

-- Trouble
keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })

-- CheatSH Documentation
keymap.set("n", "<leader>c", "<cmd>CheatSH<cr>", opts)
```
