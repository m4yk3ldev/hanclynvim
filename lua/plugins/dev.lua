return {
  { "Djancyp/cheat-sheet", cmd = "CheatSheet" },
  { "L3MON4D3/LuaSnip", lazy = true },
  { "rafamadriz/friendly-snippets", lazy = true },
  { "stevearc/vim-vscode-snippets", lazy = true },
  { "evanleck/vim-svelte", branch = "main", ft = { "svelte" } },
  {
    "dsznajder/vscode-es7-javascript-react-snippets",
    lazy = true,
    build = "yarn install --frozen-lockfile && yarn compile",
  },
}
