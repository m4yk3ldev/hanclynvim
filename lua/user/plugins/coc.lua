vim.g.coc_global_extensions = {
  'coc-html',
  'coc-json',
  'coc-css',
  'coc-tsserver',
  'coc-tabnine',
  'coc-prettier',
  'coc-eslint',
  "coc-jedi",
  "coc-pyright",
  'coc-pairs',
  'coc-marketplace',
  'coc-git',
  'coc-htmldjango',
  'coc-snippets',
  'coc-scssmodules',
  'coc-xml',
  'coc-styled-components',
  'coc-html-css-support',
  'coc-vimlsp',
  'coc-sumneko-lua',
  'coc-yank',
  'coc-spell-checker',
  'coc-cspell-dicts',
  "coc-symbol-line",
  "coc-docker",
  "coc-react-refactor",
  "coc-rls",
  "coc-gitmoji",
  "coc-yaml",
  "coc-gitignore",
  "coc-diagnostic",
}
vim.cmd('autocmd FileType scss setl iskeyword+=@-@')
vim.cmd('let g:javascript_plugin_flow = 1')
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")
vim.cmd("autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')")
vim.cmd([[
  augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END
]])
