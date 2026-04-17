local plugin = {
	name = "whichkey",
	url = "https://github.com/folke/which-key.nvim",
	lazy = true,
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require("core.mappings").set("mappings.which-key")
	end,
}

return plugin
