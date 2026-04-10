local plugin = {
	name = "tmux",
	url = "https://github.com/christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
	},
	init = function(self)
		vim.g.tmux_navigator_no_mappings = 1
		require("core.mappings").set("mappings.tmux")
	end,
	setup = function(self)
		vim.cmd.packadd(self.name)
	end,
}

return plugin
