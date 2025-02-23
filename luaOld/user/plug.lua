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
  use("kyazdani42/nvim-web-devicons")
  use("rcarriga/nvim-notify")
  use({
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({})
    end,
  })
  use("ahmedkhalf/project.nvim")
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
  use({ "ellisonleao/gruvbox.nvim" })
  use({ "folke/which-key.nvim" })

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
  use({ "stevearc/vim-vscode-snippets" }) -- Usar los snippets del Vscode
  use({ "Djancyp/cheat-sheet" }) -- Cargar documentacion de cada lenguaje

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  }) -- Instalar optimizacion del parse files
  use("JoosepAlviste/nvim-ts-context-commentstring") -- Para reconocer los commentarios
  use("p00f/nvim-ts-rainbow") -- Adornar las chaves
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("theHamsta/nvim-treesitter-pairs")
  use({ "styled-components/vim-styled-components", branch = "main" }) -- Cargar los estilos del styled-components
  use({
    "windwp/nvim-autopairs",
    require = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  }) -- Autopairs, integrates with both cmp and treesitter
  use({
    "windwp/nvim-ts-autotag",
    require = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }) -- Para Autocerrar los tag
  use({ -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })
  use("neoclide/vim-jsx-improve")
  use("pangloss/vim-javascript")
  use("yuezk/vim-js")
  use("jxnblk/vim-mdx-js")
  use({ "evanleck/vim-svelte", branch = "main" })

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("edluffy/hologram.nvim")
  use("nvim-telescope/telescope-media-files.nvim")

  use("vim-python/python-syntax")
  use("maxmellon/vim-jsx-pretty")
  use("nvim-telescope/telescope-symbols.nvim")

  -- Para syntax files HTTP files
  use("nicwest/vim-http")

  -- COC
  use({ "neoclide/coc.nvim", branch = "release", tag = "*" })

  -- GIT
  use("lewis6991/gitsigns.nvim")
  use("dinhhuy258/git.nvim") -- For git blame & browse

  use({
    "dense-analysis/neural",
    requires = {
      "MunifTanjim/nui.nvim",
      "ElPiloto/significant.nvim",
    },
  })
  use({ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" })

  --- Soporte para imagenes
  use({
    "samodostal/image.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  --- GithubCopilot
  use({ "github/copilot.vim" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
