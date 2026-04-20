local plugin = {
	deps = { 'https://github.com/tpope/vim-dadbod' },
	src = 'https://github.com/kristijanhusak/vim-dadbod-ui',
	cmd = {
		'DBUI',
		'DBUIToggle',
		'DBUIAddConnection',
		'DBUIFindBuffer',
	},
	init = function()
		require('core.mappings').set('mappings.dadbod-ui')
		-- Your DBUI configuration
		-- vim.g.db_ui_show_size = 1
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_winwidth = 60
		vim.g.db_ui_show_database_icon = 1
		-- let g:db_ui_icons = {
		--     \ 'expanded': '▾',
		--     \ 'collapsed': '▸',
		--     \ 'saved_query': '*',
		--     \ 'new_query': '+',
		--     \ 'tables': '~',
		--     \ 'buffers': '»',
		--     \ 'connection_ok': '✓',
		--     \ 'connection_error': '✕',
		--     \ }
	end,
}

return plugin
