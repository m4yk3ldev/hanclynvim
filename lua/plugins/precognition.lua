return {
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    config = function()
      -- Configuración segura con manejo de errores
      local ok, precognition = pcall(require, "precognition")
      if not ok then
        vim.notify("Error loading precognition.nvim", vim.log.levels.ERROR)
        return
      end

      -- Setup básico
      precognition.setup({})

      -- Toggle precognition on/off with <leader>tp
      vim.keymap.set("n", "<leader>tp", function()
        precognition.toggle()
      end, { desc = "Toggle Precognition hints" })
    end,
  },
}
