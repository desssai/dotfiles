local mappings = {
	n = {
		["<leader>tt"] = { "<cmd> Trouble diagnostics toggle <CR>", "Toggle diagnostics (Trouble)" },
		["<leader>tc"] = { "<cmd> Trouble symbols toggle focus=false<CR>", "Toggle symbols (Trouble)" },
		["<leader>tl"] = { "<cmd> Trouble loclist <CR>", "Toggle LocList (Trouble)" },
		["<leader>tq"] = { "<cmd> Trouble qflist <CR>", "Toggle QuickFix (Trouble)" },
		["<leader>tr"] = { "<cmd> Trouble lsp <CR>", "Toggle Lsp (Trouble)" },
	},
}

return mappings
