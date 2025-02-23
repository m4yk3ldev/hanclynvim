
# Configuración de Neovim

Este archivo contiene la configuración de Neovim utilizada con LazyVim.

## Notas importantes

- No usar `LazyVim.safe_keymap_set` en tu propia configuración. En su lugar, usa `vim.keymap.set`.
- Para mejorar la organización, asegúrate de agrupar las configuraciones en secciones bien definidas.

## Mapeo de teclas

### Mejor desplazamiento vertical
```lua
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
```

### Navegación entre ventanas con `<Ctrl> + hjkl`
```lua
map("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana izquierda", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana inferior", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana superior", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana derecha", remap = true })
```

### Ajuste del tamaño de la ventana
```lua
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Aumentar altura de la ventana" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Reducir altura de la ventana" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Reducir ancho de la ventana" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Aumentar ancho de la ventana" })
```

### Mover líneas de código
```lua
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Mover hacia abajo" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Mover hacia arriba" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Mover hacia abajo" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Mover hacia arriba" })
```

### Buffers
```lua
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Siguiente buffer" })
map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Eliminar buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Eliminar buffer y ventana" })
```

### Búsqueda y navegación
```lua
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Siguiente resultado" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Resultado anterior" })
```

### Guardar archivo
```lua
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Guardar archivo" })
```

### Dividir ventana
```lua
map("n", "<leader>v", ":vsplit<CR>", { desc = "Dividir ventana verticalmente" })
```

### Cerrar Neovim
```lua
map("n", "<C-q>", "<cmd>q!<CR>", { desc = "Cerrar Neovim sin guardar" })
```

### Terminal flotante
```lua
map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Abrir terminal flotante" })
```

### Manejo de pestañas
```lua
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Última pestaña" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Cerrar otras pestañas" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Nueva pestaña" })
```

### Atajos para Trouble
```lua
map("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true, desc = "Abrir Trouble" })
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true, desc = "Ver diagnóstico del espacio de trabajo" })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true, desc = "Ver diagnóstico del documento" })
```

### CheatSH (Documentación rápida)
```lua
map("n", "<leader>c", "<cmd>CheatSH<cr>", { desc = "Abrir CheatSH" })
```

Esta configuración mejora la navegación y personalización dentro de Neovim con LazyVim.

