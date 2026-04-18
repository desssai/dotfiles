local mappings = {
	n = {
		['<leader>/'] = {
			function()
				require('which-key').show({ global = false })
			end,
			desc = 'Buffer Local Keymaps (which-key)',
		},
		['<leader>?'] = {
			function()
				require('which-key').show({ global = true })
			end,
			desc = 'Global Keymaps (which-key)',
		},
	},
}

return mappings
