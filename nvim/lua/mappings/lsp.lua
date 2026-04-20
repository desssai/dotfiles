local mappings = {
	n = {
		['gd'] = { vim.lsp.buf.definition, 'Goto definition' },
		['gD'] = { vim.lsp.buf.declaration, 'Goto declaration' },
		['K'] = { vim.lsp.buf.hover, 'Hover' },

		-- Formatting
		['<leader>F'] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			'Format buffer',
		},

		-- Toggle codelens
		['gL'] = {
			function()
				vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
			end,
			'Toggle codelens',
		},

		-- Toggle colors
		['gC'] = {
			function()
				vim.lsp.document_color.enable(not vim.lsp.document_color.is_enabled())
			end,
			'Toggle virtual document colors',
		},
	},
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
