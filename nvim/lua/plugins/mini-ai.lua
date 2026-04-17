local plugin = {
	name = "mini.ai",
	url = "https://github.com/nvim-mini/mini.ai",
	event = { "BufReadPost", "BufNewFile" },
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup()
	end
}

return plugin
