local plugin = {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
	},
	init = function()
		require("core.mappings").set("mappings.christoomey_vim-tmux-navigator")
		vim.g.tmux_navigator_no_mappings = 1
	end,
}

return plugin
