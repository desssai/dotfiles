local plugin = {
	name = "mini.ai",
	url = "https://github.com/nvim-mini/mini.ai",
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup()
	end
}

return plugin
