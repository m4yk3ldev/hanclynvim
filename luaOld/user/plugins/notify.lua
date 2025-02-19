local status_ok, notify = pcall(require, "notify")
if status_ok then
  notify.setup({
    background_colour = '#000000',
    minimum_width = 40,
    stages = 'slide',
    icons = {
      ERROR = '[ERROR]',
      WARN = '[WARN]',
      INFO = '[INFO]',
      DEBUG = '[DEBUG]',
      TRACE = '[TRACE]',
    },
  })
  vim.notify = notify
end
