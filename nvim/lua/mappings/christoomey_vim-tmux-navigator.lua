local mappings = {

	n = {
		["<m-h>"] = { "<cmd>TmuxNavigateLeft<cr>", "Window left" },
		["<m-j>"] = { "<cmd>TmuxNavigateDown<cr>", "Window right" },
		["<m-k>"] = { "<cmd>TmuxNavigateUp<cr>", "Window down" },
		["<m-l>"] = { "<cmd>TmuxNavigateRight<cr>", "Window up" },
	},

	i = {
		["<m-h>"] = { "<cmd>TmuxNavigateLeft<cr>", "Window left" },
		["<m-j>"] = { "<cmd>TmuxNavigateDown<cr>", "Window right" },
		["<m-k>"] = { "<cmd>TmuxNavigateUp<cr>", "Window down" },
		["<m-l>"] = { "<cmd>TmuxNavigateRight<cr>", "Window up" },
	},

	v = {
		["<m-h>"] = { "<cmd><C-U>TmuxNavigateLeft<cr>", "Window left" },
		["<m-j>"] = { "<cmd><C-U>TmuxNavigateDown<cr>", "Window right" },
		["<m-k>"] = { "<cmd><C-U>TmuxNavigateUp<cr>", "Window down" },
		["<m-l>"] = { "<cmd><C-U>TmuxNavigateRight<cr>", "Window up" },
	},
}

return mappings
