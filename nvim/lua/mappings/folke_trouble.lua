local mappings = {
	n = {
		["<leader>tt"] = { "<cmd> TroubleToggle document_diagnostics <CR>", "Toggle document diagnostics" },
		["<leader>tw"] = { "<cmd> TroubleToggle workspace_diagnostics <CR>", "Toggle workspace diagnostics" },
		["<leader>tr"] = { "<cmd> TroubleToggle LspReferences <CR>", "Toggle LspReferences" },
	},
}

return mappings
