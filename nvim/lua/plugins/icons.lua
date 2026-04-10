local plugin = {
	name = "mini.icons",
	url = "https://github.com/nvim-mini/mini.icons",
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup()
	end
}

return plugin
