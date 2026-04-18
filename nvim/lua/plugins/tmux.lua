local plugin = {
	src = 'https://github.com/christoomey/vim-tmux-navigator',
	cmd = {
		'TmuxNavigateLeft',
		'TmuxNavigateDown',
		'TmuxNavigateUp',
		'TmuxNavigateRight',
	},
	init = function()
		vim.g.tmux_navigator_no_mappings = 1
		require('core.mappings').set('mappings.tmux')
	end,
}

return plugin
