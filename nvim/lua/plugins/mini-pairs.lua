local plugin = {
	name = "mini.pairs",
	url = "https://github.com/nvim-mini/mini.pairs",
	event = { "InsertEnter" },
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup()
	end
}

return plugin
