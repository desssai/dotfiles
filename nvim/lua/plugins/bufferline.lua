local plugin = {
	name = "bufferline",
	url = "https://github.com/akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup()
	end
}

return plugin
