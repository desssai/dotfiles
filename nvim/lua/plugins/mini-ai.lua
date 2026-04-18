local plugin = {
	src = 'https://github.com/nvim-mini/mini.ai',
	event = { 'BufReadPost', 'BufNewFile' },
	setup = function()
		require('mini.ai').setup()
	end,
}

return plugin
