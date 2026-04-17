local plugin = {
	name = "bufferline",
	url = "https://github.com/akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	setup = function(self)
		require('core.mappings').set('mappings.bufferline')
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup({
			options = {
				mode = "buffers",
				close_command = function(bufnr)
					require('mini.bufremove').delete(bufnr, false)
				end,
				right_mouse_command = function(bufnr)
					require('mini.bufremove').delete(bufnr, false)
				end,
				diagnostics = "nvim_lsp",
				show_buffer_icons = true,
				show_close_icon = false,
				show_buffer_close_icons = false,
				truncate_names = false,
			}
		})
	end
}

return plugin
