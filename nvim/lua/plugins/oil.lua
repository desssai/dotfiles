local plugin = {
	name = "oil",
	url = "https://github.com/stevearc/oil.nvim",
	init = function(self)
		require('core.mappings').set('mappings.oil')
	end,
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup()
	end
}

return plugin
