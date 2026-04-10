local mappings = {
	n = {
		["gd"] = { vim.lsp.buf.definition, "Goto definition" } ,
		["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
		['K'] = { vim.lsp.buf.hover, "Hover" },
		-- Diagnostics: keep these plain and fast
		['[d'] = { vim.diagnostic.goto_prev, "Prev diagnostic" },
		[']d'] = { vim.diagnostic.goto_next, "Next diagnostic" },
		['<leader>e'] = { vim.diagnostic.open_float, "Line diagnostics" },
		['<leader>dq'] = { vim.diagnostic.setloclist, "Diagnostics loclist" },
		-- Formatting
		['<leader>F'] = { function()
			vim.lsp.buf.format({ async = true })
		end, "Format buffer" },
	}
}

return mappings

		-- ['grr'] = { function()
		-- 	fzf.lsp_references({ jump1 = true, ignore_current_line = true })
		-- end, "LSP references" },
		-- ['gri'] = { function()
		-- 	fzf.lsp_implementations({ jump1 = true })
		-- end, "LSP implementations" },
		-- ['grt'] = { function()
		-- 	fzf.lsp_typedefs({ jump1 = true })
		-- end, "LSP type definitions" },
		-- ['gO'] = { function()
		-- 	fzf.lsp_document_symbols()
		-- end, "Document symbols" },
		-- ['<leader>ss'] = { function()
		-- 	fzf.lsp_workspace_symbols()
		-- end, "Workspace symbols" },
		-- ['gs'] = { function()
		-- 	fzf.lsp_finder()
		-- end, "LSP finder" },
		-- Keep native Neovim defaults for these
