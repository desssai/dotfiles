vim.g.mapleader = ' '

-- Enable filetype detection, plugins, and indentation
vim.cmd.filetype('plugin indent on')

-- Disable some default providers
for _, provider in ipairs({
	'node',
	'perl',
	'python3',
	'ruby',
	'gzip',
	'netrwPlugin',
	'rplugin',
	'tarPlugin',
	'tohtml',
	'tutor',
	'zipPlugin',
}) do
	vim.g['loaded_' .. provider .. '_provider'] = 0
end

-- Add binaries instaled by Mason for LSP functionality
vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin' .. ':' .. vim.env.PATH

require('core.options')
require('core.usercmd')
require('core.autocmd')
require('core.colorscheme')
require('core.statusline')
require('core.mappings').set('mappings.general')
require('core.pack')
require('core.lsp')

require('vim._core.ui2').enable()
