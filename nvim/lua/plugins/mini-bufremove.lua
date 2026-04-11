local plugin = {
	name = "mini.bufremove",
	url = "https://github.com/nvim-mini/mini.bufremove",
	init = function(self)
		require('core.mappings').set('mappings.mini-bufremove')
	end,
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup()
	end
}

return plugin
