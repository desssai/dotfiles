local plugin = {
	name = "mini.snippets",
	url = "https://github.com/nvim-mini/mini.snippets",
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup()
	end,
}

return plugin
