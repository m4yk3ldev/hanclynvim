
# Keymaps Configuration - Neovim

This file contains documentation for custom keymaps configured in this LazyVim setup.

## Important Notes

- Don't use `LazyVim.safe_keymap_set` in your own configuration. Use `vim.keymap.set` instead.
- Keymaps are defined in `/lua/config/keymaps.lua` and in individual plugin files.
- LazyVim already includes many default keymaps. Only custom keymaps are documented here.

## Custom Keymaps

### Split Window Vertically

```lua
keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
```

**Description:** Splits the window vertically.

### Save File

```lua
keymap.set("n", "<C-s>", "<cmd>w!<CR>", { desc = "Force save file" })
keymap.set("i", "<C-s>", "<cmd>w!<CR><esc>", { desc = "Force save file" })
```

**Description:** Force saves the current file.

### Quit Neovim

```lua
keymap.set("n", "<C-q>", "<cmd>q!<CR>", { desc = "Force quit" })
```

**Description:** Quits Neovim without saving changes.

### Duplicate Line

```lua
keymap.set("n", "tt", "<cmd>t.<CR>", { desc = "Duplicate line" })
```

**Description:** Duplicates the current line below it.

### Select All

```lua
keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })
```

**Description:** Selects all content in the file.

> **⚠️ Important Change:** Changed from `<C-a>` to `<leader>sa` to avoid conflicts with plugins like dial.nvim that use `<C-a>` for incrementing numbers.

### ToggleTerm

```lua
keymap.set("n", "<F2>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
```

**Description:** Opens/closes the floating terminal.

### Reload Configuration

```lua
keymap.set("n", "<leader>ur", function()
  if pcall(reload_nvim_conf) then
    vim.notify("Config reloaded", vim.log.levels.INFO)
  else
    vim.cmd("source $MYVIMRC")
    vim.notify("Config sourced", vim.log.levels.INFO)
  end
end, { desc = "Reload Neovim config" })
```

**Description:** Reloads Neovim configuration.

> **⚠️ Important Change:** Changed from `<C-R>` to `<leader>ur` to avoid overwriting Vim's native "redo" command. The `u` prefix is consistent with other LazyVim toggles.

### Trouble (Diagnostics)

```lua
keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics<cr>", { desc = "Workspace Diagnostics (Trouble)" })
keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics filter.buf=0<cr>", { desc = "Document Diagnostics (Trouble)" })
```

**Description:**

- `<leader>xw`: Shows workspace diagnostics
- `<leader>xd`: Shows diagnostics for current document/buffer

> **📝 Note:** LazyVim already includes the following Trouble keymaps by default:
>
> - `<leader>xx`: Diagnostics (Trouble)
> - `<leader>xX`: Buffer Diagnostics (Trouble)
> - `<leader>xL`: Location List (Trouble)
> - `<leader>xQ`: Quickfix List (Trouble)
>
> Custom keymaps only maintain `<leader>xw` and `<leader>xd` with the new Trouble v3 syntax.

### Precognition (Plugin)

```lua
keymap.set("n", "<leader>tp", function()
  precognition.toggle()
end, { desc = "Toggle Precognition hints" })
```

**Description:** Toggles Precognition hints (motion hints).

## LazyVim Default Keymaps

LazyVim includes many useful default keymaps. The most important ones are:

### Window Navigation

- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`: Navigate between windows

### Buffers

- `<S-h>`, `<S-l>`: Previous/next buffer
- `<leader>bd`: Delete buffer

### Tabs

- `<leader><tab>l`: Last tab
- `<leader><tab>o`: Close other tabs
- `<leader><tab><tab>`: New tab

### Resize Windows

- `<C-Up>`, `<C-Down>`, `<C-Left>`, `<C-Right>`: Adjust window size

### Move Lines

- `<A-j>`, `<A-k>`: Move line down/up (normal and insert mode)

### GitHub Copilot Chat

- `<leader>aa`: Toggle Copilot Chat
- `<leader>aq`: Quick Chat
- `<leader>ap`: Prompt Actions
- `<leader>ax`: Clear Chat

For all available keymaps in LazyVim, visit: <https://www.lazyvim.org/keymaps>

---

**Last updated:** December 2025
