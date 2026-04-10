local plugin = {
	name = "whichkey",
	url = "https://github.com/folke/which-key.nvim",
	lazy = true,
	setup = function(self)
		vim.cmd.packadd(self.name)
		require("core.mappings").set("mappings.which-key")
	end,
}

return plugin
