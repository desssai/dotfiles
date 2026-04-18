local plugin = {
	src = 'https://github.com/folke/which-key.nvim',
	lazy = true,
	setup = function()
		require('core.mappings').set('mappings.which-key')
	end,
}

return plugin
