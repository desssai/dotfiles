local plugin = {
	name = "bufferline",
	url = "https://github.com/akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup({
			options = {
				-- Show buffers only for the currently shown tab
				custom_filter = function(buf, buf_nums)
					local tabn = vim.fn.tabpagenr()
					local bufs = vim.fn.tabpagebuflist(tabn)
					for _, bufn in ipairs(bufs) do
						if bufn == buf then
							return true
						end
						return
					end
				end
			},
		})
	end
}

return plugin
