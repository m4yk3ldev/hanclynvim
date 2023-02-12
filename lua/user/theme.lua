vim.opt.termguicolors = true
-- Theme the GruvBox
--[[ require("gruvbox").setup({ ]]
--[[   undercurl = true, ]]
--[[   underline = true, ]]
--[[   bold = true, ]]
--[[   italic = true, ]]
--[[   strikethrough = true, ]]
--[[   invert_selection = false, ]]
--[[   invert_signs = false, ]]
--[[   invert_tabline = false, ]]
--[[   invert_intend_guides = false, ]]
--[[   inverse = true, -- invert background for search, diffs, statuslines and errors ]]
--[[   contrast = "", -- can be "hard", "soft" or empty string ]]
--[[   palette_overrides = {}, ]]
--[[   overrides = {}, ]]
--[[   dim_inactive = false, ]]
--[[   transparent_mode = false, ]]
--[[ }) ]]
--[[ vim.cmd("colorscheme gruvbox") ]]
----[[ vim.cmd([[colorscheme gruvbox]])


require("tokyonight").setup({
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
})

-- Lua
vim.cmd([[colorscheme tokyonight-storm]])
vim.cmd("colorscheme tokyonight-storm")
