local plugin = {
	name = "mini.pairs",
	url = "https://github.com/nvim-mini/mini.pairs",
	event = { "InsertEnter" },
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup()
	end
}

return plugin
