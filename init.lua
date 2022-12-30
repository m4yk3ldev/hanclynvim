local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end
require("user.config") -- Para cargar todas las configuraciones básicas
require("user.plug") -- Cargando los plugins
require("user.plugins") -- Cargando los theme
require("user.keymap") -- Cargando keyboard principales
require("user.theme") -- Cargando los theme
require("user.autocmd") -- Para cargar los plugins
