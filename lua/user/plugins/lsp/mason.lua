local statusMason, mason = pcall(require, "mason")
if (not statusMason) then return end

local status2, lspconfigMason = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup()

lspconfigMason.setup {
  automatic_installation = true,
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "pyright",
    "bashls",
    "cssls",
    "dockerls",
    "cssmodules_ls",
    "emmet_ls",
  }
}
