local mappings = {
	n = {
		-- Fzf-lua hotkeys
		["<leader>ff"] = { "<cmd>FzfLua files<CR>", "Find files" },
		["<leader>fg"] = { "<cmd>FzfLua live_grep<CR>", "Find string" },
		["<leader>fo"] = { "<cmd>FzfLua oldfiles<CR>", "Find oldfiles" },
		["<leader>fO"] = { "<cmd>FzfLua buffers<CR>", "Find buffers" },
		["<leader>fl"] = { "<cmd>FzfLua blines<CR>", "Find line in current buffer" },

		-- FzfLua git hotkeys
		["<leader>gf"] = { "<cmd>FzfLua git_files <CR>", "Git files" },
		["<leader>gc"] = { "<cmd>FzfLua git_commits<CR>", "Git commits" },
		["<leader>gC"] = { "<cmd>FzfLua git_bcommits <CR>", "Git commits for current buffer" },
		["<leader>gs"] = { "<cmd>FzfLua git_status <CR>", "Git status" },
		["<leader>gS"] = { "<cmd>FzfLua git_stash <CR>", "Git stash" },
		["<leader>gb"] = { "<cmd>FzfLua git_branches <CR>", "Git Branches" },

		-- FzfLua lsp hotkeys
		["<leader>ft"] = { "<cmd>FzfLua diagnostics_document<CR>", "Document diagnostics" },
		["<leader>fT"] = { "<cmd>FzfLua diagnostics_workspace<CR>", "Workspace diagnostics" },
		["gra"] = { "<cmd>FzfLua lsp_code_actions<CR>", "Lsp code actions" },
		["grr"] = { "<cmd>FzfLua lsp_references<CR>", "Lsp references" },
		["grt"] = { "<cmd>FzfLua lsp_typedefs<CR>", "Lsp type definitions" },
		["gri"] = { "<cmd>FzfLua lsp_implementations<CR>", "Lsp implementations" },

		-- FzfLua misc hotkeys
		["<leader>f?"] = { "<cmd>FzfLua helptags<CR>", "Help page" },
		["<leader>fc"] = { "<cmd>FzfLua commands<CR>", "Help page" },
		["<leader>fk"] = { "<cmd>FzfLua keymaps<CR>", "Search keymaps" },
		["<leader>f/"] = { "<cmd>FzfLua search_history<CR>", "Search history" },
		["<leader>fh"] = { "<cmd>FzfLua highlights<CR>", "Find highlights" },
		["<leader>fm"] = { "<cmd>FzfLua marks<CR>", "telescope bookmarks" },
	},
}

return mappings
