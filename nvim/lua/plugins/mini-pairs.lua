local plugin = {
	src = 'https://github.com/nvim-mini/mini.pairs',
	event = { 'InsertEnter' },
	setup = function()
		require('mini.pairs').setup()
	end,
}

return plugin
