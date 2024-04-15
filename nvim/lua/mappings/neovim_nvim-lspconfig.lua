local mappings = {
	n = {
		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"LSP hover",
		},
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"LSP declaration",
		},
		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"LSP definition",
		},
		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"LSP implementation",
		},
		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"LSP references",
		},
		["[d"] = {
			function()
				vim.diagnostic.goto_prev({ float = { border = "rounded" } })
			end,
			"Goto prev",
		},
		["]d"] = {
			function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end,
			"Goto next",
		},
		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"LSP definition type",
		},
		["<leader>sm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},
		["<leader>sh"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"LSP signature help",
		},
		["<leader>sa"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},
		["<leader>sf"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},
		["<leader>sq"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},
		-- ["<leader>wa"] = {
		-- 	function()
		-- 		vim.lsp.buf.add_workspace_folder()
		-- 	end,
		-- 	"Add workspace folder",
		-- },
		-- ["<leader>wr"] = {
		-- 	function()
		-- 		vim.lsp.buf.remove_workspace_folder()
		-- 	end,
		-- 	"Remove workspace folder",
		-- },
		-- ["<leader>wl"] = {
		-- 	function()
		-- 		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- 	end,
		-- 	"List workspace folders",
		-- },
	},
}

return mappings
