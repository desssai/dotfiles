local plugin = {
	src = 'https://github.com/ibhagwan/fzf-lua',
	cmd = { 'FzfLua' },
	init = function()
		require('core.mappings').set('mappings.fzf-lua')
	end,
	setup = function()
		require('fzf-lua').setup({
			winopts = {
				border = 'none',
				backdrop = 60,
				preview = {
					border = 'none',
				},
			},
			keymap = {
				builtin = {
					['<c-f>'] = 'preview-page-down',
					['<c-b>'] = 'preview-page-up',
					['<c-d>'] = 'preview-down',
					['<c-u>'] = 'preview-up',
				},
				fzf = {
					['ctrl-q'] = 'select-all+accept',
				},
			},
		})
		require('fzf-lua').register_ui_select()
	end,
}

return plugin
