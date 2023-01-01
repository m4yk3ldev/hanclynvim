-- Autocommand that reloads neovim whenever you save the plug.lua
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plug.lua source <afile> | PackerInstall
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  local fn = vim.fn

  -- Automatically install packer
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
  end
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  max_jobs = 1,
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("lewis6991/impatient.nvim")
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("antoinemadec/FixCursorHold.nvim") -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use "kyazdani42/nvim-web-devicons"
  use("rcarriga/nvim-notify")
  use { "j-hui/fidget.nvim", config = function()
    require "fidget".setup {}
  end }
  use("ahmedkhalf/project.nvim")
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use("moll/vim-bbye")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use("kyazdani42/nvim-tree.lua")
  use("norcalli/nvim-colorizer.lua")
  use({ "akinsho/toggleterm.nvim", branch = "main" })
  use("folke/trouble.nvim")

  -- Theme
  use { "ellisonleao/gruvbox.nvim" }
  use { "folke/which-key.nvim" }

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
  use({ "stevearc/vim-vscode-snippets" }) -- Usar los snippets del Vscode
  use { "Djancyp/cheat-sheet" } -- Cargar documentacion de cada lenguaje

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }) -- Instalar optimizacion del parse files
  use("JoosepAlviste/nvim-ts-context-commentstring") -- Para reconocer los commentarios
  use("p00f/nvim-ts-rainbow") -- Adornar las chaves
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("theHamsta/nvim-treesitter-pairs")
  use({ "styled-components/vim-styled-components", branch = "main" }) -- Cargar los estilos del styled-components
  use({ "windwp/nvim-autopairs", require = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-autopairs").setup()
    end
  }) -- Autopairs, integrates with both cmp and treesitter
  use({ "windwp/nvim-ts-autotag", require = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }) -- Para Autocerrar los tag
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
    }
  }
  use("neoclide/vim-jsx-improve")
  use("pangloss/vim-javascript")
  use("yuezk/vim-js")
  use('jxnblk/vim-mdx-js')
  use { "evanleck/vim-svelte", branch = "main" }

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("edluffy/hologram.nvim")
  use("nvim-telescope/telescope-media-files.nvim")
  use("vim-python/python-syntax")
  use("maxmellon/vim-jsx-pretty")
  use("nvim-telescope/telescope-symbols.nvim")

  -- Rest API
  use("NTBBloodbath/rest.nvim")

  -- Para syntax files HTTP files
  use("nicwest/vim-http")

  -- LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  --[[ use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua ]]
  use { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig' } -- LSP
  use 'glepnir/lspsaga.nvim' -- LSP UIs

  -- Completion (CMP)
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-cmdline' -- Comando cmdline
  use 'hrsh7th/cmp-path' -- Path
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' } -- Habilitar el Tabnine
  use "folke/neodev.nvim"

  -- GIT
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- Spotify
  -- Lua
  use {
    'KadoBOT/nvim-spotify',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
      local spotify = require 'nvim-spotify'

      spotify.setup {
        -- default opts
        status = {
          update_interval = 10000, -- the interval (ms) to check for what's currently playing
          format = '%s %t by %a' -- spotify-tui --format argument
        }
      }
    end,
    run = 'make'
  }

  use({
    'dense-analysis/neural',
    'MunifTanjim/nui.nvim',
    'ElPiloto/significant.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'ElPiloto/significant.nvim'
    }
  })
  use { 'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
