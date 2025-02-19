local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "_next",
      ".next",
      ".git",
      ".vscode",
    },
  },
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },
})

telescope.load_extension("media_files")
telescope.load_extension("projects")
telescope.load_extension("notify")
