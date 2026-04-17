local plugin = {
	name = "mini.icons",
	url = "https://github.com/nvim-mini/mini.icons",
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup()
	end,
}

return plugin
