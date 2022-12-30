local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Para dividar pantalla
keymap("n", "<leader>v", ":vsplit<CR>", opts)
-- ForceWrite
keymap("n", "<C-s>", "<cmd>w!<CR>", opts)

-- ForceQuit
keymap("n", "<C-q>", "<cmd>q!<CR>", opts)
-- Turn off search highlighting
keymap('n', '<Esc>', ':noh<CR>', opts)
-- Get out of the Terminal
keymap('t', '<Esc>', '<C-\\><C-n>', opts)
-- Duplicate Line
keymap('n', 'tt', ':t.<CR>', opts)

-- Recargar las configuraciones
keymap('n', '<C-r>', '<cmd>lua reload_nvim_conf()<CR>', opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>lp", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
keymap("n", "<leader>h", "<cmd>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>e", "<cmd>Telescope symbols<cr>"
  , opts)

-- Para selecionar todo
keymap("n", "<C-a>", "ggVG", opts)

-- LSP
keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- NvimTree mapping
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-f>", ":NvimTreeFindFile<CR>", opts)

-- CheatSH Documentation
keymap("n", "<leader>c", "<cmd>CheatSH<cr>", opts)

-- RestNvim
keymap("n", "<leader>r", "<Plug>RestNvim<cr>", opts)
keymap("n", "<leader>rp", "<Plug>RestNvimPreview<cr>", opts)
keymap("n", "<leader>rl", "<Plug>RestNvimLast<cr>", opts)

-- ToggleTerm
keymap("n", "<F2>", "<cmd>ToggleTerm<cr>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
