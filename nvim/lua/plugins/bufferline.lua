local plugin = {
	src = 'https://github.com/akinsho/bufferline.nvim',
	lazy = true,
	setup = function()
		require('core.mappings').set('mappings.bufferline')
		require('bufferline').setup({
			options = {
				mode = 'buffers',
				close_command = 'BufDelete',
				right_mouse_command = 'BufDelete',
				diagnostics = 'nvim_lsp',
				show_buffer_icons = true,
				show_close_icon = false,
				show_buffer_close_icons = false,
				truncate_names = false,
			},
		})
	end,
}

return plugin
