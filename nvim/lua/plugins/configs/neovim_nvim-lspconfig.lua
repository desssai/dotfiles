local plugin = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local lsp_defaults = lspconfig.util.default_config

		lsp_defaults.capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- lsp_defaults.capabilities.textDocument.completion.completionItem.snippetSupport = true

		local on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			require("core.mappings").set("mappings.neovim_nvim-lspconfig", bufnr)
		end

		local servers = {
			"cssls", -- CSS LSP
			"clangd", -- C,C++ LSP
			"bashls", -- Bash LSP
			"dockerls", -- Docker LSP
			"docker_compose_language_service", -- Docker-Compose LSP
			"marksman", -- Markdown LSP
			"tsserver", -- TS & JS LSP
			"pylsp", -- Python LSP
			"templ", -- Templ LSP
			"sqlls", -- SQL LSP
			"tailwindcss", -- Tailwindcss LSP
		}

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = lsp_defaults.capabilities,

			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				capabilities = lsp_defaults.capabilities,
			})
		end

		lspconfig["gopls"].setup({
			on_attach = on_attach,
			capabilities = lsp_defaults.capabilities,
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
	end,
}

return plugin
