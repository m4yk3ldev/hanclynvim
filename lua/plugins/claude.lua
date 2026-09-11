-- Claude Code integration (coder/claudecode.nvim)
-- Extends the `lazyvim.plugins.extras.ai.claudecode` extra enabled in lua/config/lazy.lua.
-- Base keymaps from the extra: <leader>ac toggle, <leader>af focus, <leader>ar resume,
-- <leader>aC continue, <leader>ab add buffer, <leader>as send selection, <leader>aa/<leader>ad accept/deny diff.
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    -- Cargar al inicio para que el servidor WebSocket esté listo y un `claude` externo
    -- (otra terminal) pueda conectarse con /ide sin tener que abrir el panel primero.
    event = "VeryLazy",
    opts = {
      auto_start = true,
      track_selection = true,
      focus_after_send = true,
      terminal = {
        split_side = "right",
        split_width_percentage = 0.35,
        diff_split_width_percentage = 0.25,
        provider = "snacks",
      },
      diff_opts = {
        layout = "vertical",
        open_in_new_tab = false,
        keep_terminal_focus = false,
      },
    },
    keys = {
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>aS", "<cmd>ClaudeCodeStatus<cr>", desc = "Claude status" },
      { "<leader>aD", "<cmd>ClaudeCodeCloseAllDiffs<cr>", desc = "Close all Claude diffs" },
      -- Toggle rápido del panel, también desde dentro de la terminal de Claude
      { "<C-,>", "<cmd>ClaudeCodeFocus<cr>", mode = { "n", "x", "t" }, desc = "Toggle Claude" },
    },
  },
}
