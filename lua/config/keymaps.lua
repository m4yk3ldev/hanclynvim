-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Dividir pantalla verticalmente (complementa los splits por defecto de LazyVim)
keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Split window vertically" })

-- Guardar archivo con fuerza (sobreescribe el default de LazyVim para añadir !)
keymap.set("n", "<C-s>", "<cmd>w!<CR>", { desc = "Force save file" })
keymap.set("i", "<C-s>", "<cmd>w!<CR><esc>", { desc = "Force save file" })

-- Salir de Neovim sin guardar
keymap.set("n", "<C-q>", "<cmd>q!<CR>", { desc = "Force quit" })

-- Duplicar línea actual
keymap.set("n", "tt", "<cmd>t.<CR>", { desc = "Duplicate line" })

-- Seleccionar todo el buffer
keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })

-- ToggleTerm (requiere el plugin akinsho/toggleterm.nvim)
keymap.set("n", "<F2>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

-- Recargar configuración de Neovim
keymap.set("n", "<leader>ur", function()
  if pcall(reload_nvim_conf) then
    vim.notify("Config reloaded", vim.log.levels.INFO)
  else
    vim.cmd("source $MYVIMRC")
    vim.notify("Config sourced", vim.log.levels.INFO)
  end
end, { desc = "Reload Neovim config" })

-- Trouble (estos keymaps son redundantes con los defaults de LazyVim)
-- Los mantenemos para compatibilidad, pero considera usar los defaults:
-- <leader>xx ya está definido por defecto en LazyVim
-- <leader>xl y <leader>xq también están en los defaults
keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics<cr>", { desc = "Workspace Diagnostics (Trouble)" })
keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics filter.buf=0<cr>", { desc = "Document Diagnostics (Trouble)" })
