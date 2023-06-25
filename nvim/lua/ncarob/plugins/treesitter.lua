local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	print('TREESITTER NOT FOUND!')
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
  	highlight = {
  	  enable = true,
  	},
  	-- enable indentation
  	indent = { enable = true },
  	-- enable autotagging (w/ nvim-ts-autotag plugin)
  	autotag = { enable = true },
  	-- ensure these language parsers are installed
  	ensure_installed = {
		'c',
		'lua',
		'vim',
		'vimdoc',
		'query',
		'bash',
		'cmake',
		'cpp',
		'dockerfile',
		'go',
		'json',
		'latex',
		'markdown',
		'sql'
  	},
  	-- auto install above language parsers
  	auto_install = true,
})
