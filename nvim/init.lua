vim.g.loaded_gzip = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tohtml = 1
vim.g.loaded_tutor = 1
vim.g.loaded_zipPlugin = 1

require("core.options")
require("core.usercmd")
require("core.autocmd")
require("core.colorscheme")
require("core.statusline")
require("core.mappings").set("mappings.general")
require("core.pack")
require("core.lsp")
