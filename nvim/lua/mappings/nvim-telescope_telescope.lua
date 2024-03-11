local mappings = {

	n = {
		-- Telescope find hotkeys
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Find string" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
		["<leader>f?"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
		["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Available mappings" },
		["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "Suggested diagnostics" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
		["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find string in current buffer" },
		["<leader>fm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },

		-- Telescope git hotkeys
		["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
		["<leader>gf"] = { "<cmd> Telescope git_bcommits <CR>", "Git commits for current file" },
		["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
		["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "Git Branches" },
	},
}

return mappings
