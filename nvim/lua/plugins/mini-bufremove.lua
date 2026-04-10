local plugin = {
	name = "mini.bufremove",
	url = "https://github.com/nvim-mini/mini.bufremove",
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup()
	end
}

return plugin
