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
	end,
}

return plugin
