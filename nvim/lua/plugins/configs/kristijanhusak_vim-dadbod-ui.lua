local plugin = {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		require("core.mappings").set("mappings.kristijanhusak_vim-dadbod-ui")
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_winwidth = 40
		vim.g.db_ui_show_database_icon = 1
	end,
}

return plugin
