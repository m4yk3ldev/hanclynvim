-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap

--Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Divider screen
keymap.set("n", "<leader>v", ":vsplit<CR>", opts)

-- ForceWrite
keymap.set("n", "<C-s>", "<cmd>w!<CR>", opts)

-- ForceQuit
keymap.set("n", "<C-q>", "<cmd>q!<CR>", opts)

-- Duplicate Line
keymap.set("n", "tt", ":t.<CR>", opts)

-- Para selecionar todo
keymap.set("n", "<C-a>", "ggVG", opts)

-- ToggleTerm
keymap.set("n", "<F2>", "<cmd>ToggleTerm<cr>", opts)
