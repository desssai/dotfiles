local plugin = {
	name = "bufferline",
	url = "https://github.com/akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	setup = function(self)
		require('core.mappings').set('mappings.bufferline')
		vim.cmd.packadd(self.name)
		require(self.name).setup({
			options = {
				mode = "buffers",
				close_command = "bdelete! %d",   -- can be a string | function, | false see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
				diagnostics = "nvim_lsp",
				show_buffer_icons = true,
				show_buffer_close_icons = false,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { 'close' }
				},
			}
		})
	end
}

return plugin
