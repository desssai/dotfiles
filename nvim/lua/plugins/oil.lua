local plugin = {
	deps = {
		require('plugins.mini-icons'),
	},
	src = 'https://github.com/stevearc/oil.nvim',
	init = function()
		require('core.mappings').set('mappings.oil')
	end,
	setup = function()
		require('oil').setup({
			columns = {
				'icon',
				'size',
				'permissions',
			},
			win_options = {
				colorcolumn = '',
			},
			float = {
				padding = 2,
				max_height = 0.8,
				max_width = 0.8,
				border = 'solid',
			},
			keymaps = {
				['g?'] = { 'actions.show_help', mode = 'n' },
				['<CR>'] = 'actions.select',
				['<C-CR>'] = { 'actions.select', opts = { close = false } },
				['<C-v>'] = { 'actions.select', opts = { vertical = true } },
				['<C-\\>'] = { 'actions.select', opts = { horizontal = true } },
				['<C-t>'] = { 'actions.select', opts = { tab = true } },
				['<esc>'] = { 'actions.close', mode = 'n' },
				['<C-c>'] = { 'actions.close', mode = 'n' },
				['<C-q>'] = { 'actions.send_to_qflist', opts = { action = 'r', target = 'qflist' } },
				['<C-p>'] = 'actions.preview',
				['<C-r>'] = 'actions.refresh',
				['-'] = { 'actions.parent', mode = 'n' },
				['_'] = { 'actions.open_cwd', mode = 'n' },
				['`'] = { 'actions.cd', mode = 'n' },
				['g~'] = { 'actions.cd', opts = { tab = true }, mode = 'n' },
				['gs'] = { 'actions.change_sort', mode = 'n' },
				['gx'] = 'actions.open_external',
				['gh'] = { 'actions.toggle_hidden', mode = 'n' },
				['gt'] = { 'actions.toggle_trash', mode = 'n' },
			},
			use_default_keymaps = false,
		})
	end,
}

return plugin
