local options = {
  ensure_installed = {
		'c',                -- Mandatory TS package
		'lua',              -- Mandatory TS package
		'vim',              -- Mandatory TS package
		'vimdoc',           -- Mandatory TS package
		'query',            -- Mandatory TS package
		'bash',
		'cmake',
    'comment',
		'cpp',
		'dockerfile',
		'go',
		'json',
		'latex',
		'markdown',
		'sql'
  	},

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options

