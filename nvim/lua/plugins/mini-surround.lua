local plugin = {
	name = "mini.surround",
	url = "https://github.com/nvim-mini/mini.surround",
	event = { "InsertEnter" },
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup({})
	end
}

return plugin
