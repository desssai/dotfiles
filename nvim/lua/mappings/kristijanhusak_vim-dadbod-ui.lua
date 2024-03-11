local mappings = {
	n = {
		["<leader>dt"] = { "<cmd> DBUIToggle <CR>", "Toggle Database UI" },
		["<leader>da"] = { "<cmd> DBUIAddConnection <CR>", "Add a new database connection" },
		["<leader>df"] = { "<cmd> DBUIFindBuffer <CR>", "Find the database buffer" },
	},
}

return mappings
