local plugin = {
	name = "fzf-lua",
	url = "https://github.com/ibhagwan/fzf-lua",
	cmd = { "FzfLua" },
	init = function(self)
		require('core.mappings').set('mappings.fzf-lua')
	end,
	opts = {
		winopts = {
			border = 'none',
			backdrop = 60,
			preview = {
				border = 'none',
			},
		},
		keymap = {
			fzf = {
				["ctrl-q"] = "select-all+accept",
			},
		},
	},
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup(self.opts)
	end
}

return plugin
