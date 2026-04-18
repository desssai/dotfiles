local plugin = {
	src = 'https://github.com/nvim-mini/mini.surround',
	event = { 'BufReadPost', 'BufNewFile' },
	setup = function()
		require('mini.surround').setup({})
	end,
}

return plugin
