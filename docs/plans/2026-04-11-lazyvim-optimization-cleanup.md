# LazyVim Optimization & Cleanup Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Optimizar el startup de HanclyNvim eliminando plugins redundantes, habilitando lazy-loading por defecto, y corrigiendo configuración muerta.

**Architecture:** Config declarativa sobre LazyVim. Los cambios respetan el modelo de specs de lazy.nvim: cada plugin debe tener un trigger apropiado (cmd, keys, ft, event) o ser marcado como dependencia. LazyVim extras ya proveen syntax/LSP/snippets para los lenguajes habilitados.

**Tech Stack:** Neovim >= 0.9, LazyVim, lazy.nvim, Lua, StyLua

---

### Task 1: Habilitar lazy-loading por defecto

**Files:**
- Modify: `lua/config/lazy.lua:55`

**Step 1: Cambiar defaults.lazy a true**

```lua
-- Antes
defaults = {
  lazy = false,
  version = false,
},

-- Despues
defaults = {
  lazy = true,
  version = false,
},
```

**Step 2: Verificar que Neovim inicia correctamente**

Run: `nvim --startuptime /tmp/startup-task1.log --headless -c 'qa!'`
Run: `tail -1 /tmp/startup-task1.log`
Expected: Neovim arranca sin errores. Startup time deberia bajar.

**Step 3: Commit**

```bash
git add lua/config/lazy.lua
git commit -m "perf: enable lazy-loading by default (defaults.lazy = true)"
```

---

### Task 2: Eliminar duplicado de tailwind en lazy.lua

**Files:**
- Modify: `lua/config/lazy.lua:41`

**Step 1: Eliminar la linea duplicada**

Eliminar la segunda ocurrencia de `{ import = "lazyvim.plugins.extras.lang.tailwind" }` en linea 41. Solo debe quedar la de linea 38.

**Step 2: Verificar**

Run: `nvim --headless -c 'qa!'`
Expected: Sin errores.

**Step 3: Commit**

```bash
git add lua/config/lazy.lua
git commit -m "fix: remove duplicate tailwind extra import"
```

---

### Task 3: Limpiar dev.lua — eliminar plugins de sintaxis redundantes con Treesitter

**Files:**
- Modify: `lua/plugins/dev.lua`

**Step 1: Eliminar plugins de sintaxis legacy**

Eliminar estos plugins que ya estan cubiertos por los LazyVim extras de typescript/python:

```lua
-- ELIMINAR estas lineas:
{ "neoclide/vim-jsx-improve" },
{ "pangloss/vim-javascript" },
{ "yuezk/vim-js" },
{ "jxnblk/vim-mdx-js" },
{ "vim-python/python-syntax" },
{ "maxmellon/vim-jsx-pretty" },
```

**Step 2: Agregar lazy-loading a snippets restantes**

```lua
return {
  { "Djancyp/cheat-sheet", cmd = "CheatSheet" },
  { "L3MON4D3/LuaSnip", lazy = true },
  { "rafamadriz/friendly-snippets", lazy = true },
  { "stevearc/vim-vscode-snippets", lazy = true },
  { "evanleck/vim-svelte", branch = "main", ft = { "svelte" } },
  { "dsznajder/vscode-es7-javascript-react-snippets", lazy = true, build = "yarn install --frozen-lockfile && yarn compile" },
}
```

**Step 3: Verificar**

Run: `nvim --headless -c 'qa!'`
Expected: Sin errores.

Run: `nvim --startuptime /tmp/startup-task3.log --headless -c 'qa!'`
Run: `tail -1 /tmp/startup-task3.log`
Expected: Startup mas rapido que Task 1.

**Step 4: Commit**

```bash
git add lua/plugins/dev.lua
git commit -m "perf: remove legacy syntax plugins redundant with treesitter, add lazy-loading to snippets"
```

---

### Task 4: Arreglar colorscheme — init muerto a opts + priority

**Files:**
- Modify: `lua/plugins/colorscheme.lua`

**Step 1: Reescribir el spec del colorscheme**

```lua
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  opts = {
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
  },
}
```

**Step 2: Verificar que el colorscheme aplica**

Run: `nvim --headless -c 'echo g:colors_name' -c 'qa!'`
Expected: gruvbox aplica sin flash de color.

**Step 3: Commit**

```bash
git add lua/plugins/colorscheme.lua
git commit -m "fix: colorscheme config was dead code (init returned unused table), use opts + priority"
```

---

### Task 5: Mover autocmd de options.lua a autocmds.lua

**Files:**
- Modify: `lua/config/options.lua:60-64` (eliminar)
- Modify: `lua/config/autocmds.lua` (agregar)

**Step 1: Eliminar autocmd de options.lua**

Eliminar estas lineas de `options.lua`:

```lua
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
```

**Step 2: Agregar autocmd a autocmds.lua**

Agregar al final de `lua/config/autocmds.lua`:

```lua
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
```

**Step 3: Commit**

```bash
git add lua/config/options.lua lua/config/autocmds.lua
git commit -m "refactor: move InsertLeave autocmd from options.lua to autocmds.lua"
```

---

### Task 6: Eliminar duplicado de emoji y limpiar options.lua

**Files:**
- Modify: `lua/config/options.lua:54`

**Step 1: Eliminar el vim.opt.emoji duplicado en linea 54**

La linea 41 ya tiene `vim.opt.emoji = true`. Eliminar la linea 54 que lo repite.

**Step 2: Eliminar la funcion global _G.reload_nvim_conf**

Eliminar lineas 78-87 de `options.lua`. Mover la logica inline al keymap en `keymaps.lua`:

En `lua/config/keymaps.lua`, reemplazar el keymap de `<leader>ur`:

```lua
keymap.set("n", "<leader>ur", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^lsp") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end, { desc = "Reload Neovim config" })
```

**Step 3: Verificar**

Run: `nvim --headless -c 'qa!'`
Expected: Sin errores.

**Step 4: Commit**

```bash
git add lua/config/options.lua lua/config/keymaps.lua
git commit -m "refactor: remove duplicate emoji opt, inline reload function into keymap"
```

---

### Task 7: Formatear y verificacion final

**Step 1: Formatear con StyLua**

Run: `stylua lua/`

**Step 2: Medir startup final**

Run: `nvim --startuptime /tmp/startup-final.log --headless -c 'qa!'`
Run: `tail -1 /tmp/startup-final.log`
Expected: Mejora significativa vs baseline.

**Step 3: Verificar Lazy profile**

Run: `nvim -c 'Lazy profile'`
Expected: La mayoria de plugins muestran triggers (cmd, keys, ft, event), no "startup".

**Step 4: Commit final si stylua cambio algo**

```bash
git add -A lua/
git commit -m "style: format lua files with stylua"
```
