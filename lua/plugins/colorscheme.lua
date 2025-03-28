return {
  "ellisonleao/gruvbox.nvim",
  lazy = true,
  init = function()
    return {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        operators = true,
        comments = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = false,
      contrast = "",
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    }
  end,
}
