local plugin = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local lsp_defaults = lspconfig.util.default_config

		lsp_defaults.capabilities = require("cmp_nvim_lsp").default_capabilities()
		lsp_defaults.capabilities.textDocument.completion.completionItem.snippetSupport = true

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {
			clear = false,
		})

		local templ_attach = function(client, bufnr)
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})

			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			require("core.mappings").set("mappings.neovim_nvim-lspconfig", bufnr)

			local templ_format = function()
				local filename = vim.api.nvim_buf_get_name(bufnr)
				local cmd = "templ fmt " .. vim.fn.shellescape(filename)

				vim.fn.jobstart(cmd, {
					on_exit = function()
						-- Reload the buffer only if it's still the current buffer
						if vim.api.nvim_get_current_buf() == bufnr then
							vim.cmd("e!")
						end
					end,
				})
			end

			vim.api.nvim_create_autocmd("BufWritePost", {
				group = augroup,
				buffer = bufnr,
				callback = templ_format,
				-- callback = function()
				-- 	vim.lsp.buf.format({ bufnr = bufnr })
				-- end,
			})
		end

		local on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			require("core.mappings").set("mappings.neovim_nvim-lspconfig", bufnr)
		end

		local servers = {
			"clangd", -- C,C++ LSP
			"bashls", -- Bash LSP
			"dockerls", -- Docker LSP
			"docker_compose_language_service", -- Docker-Compose LSP
			"marksman", -- Markdown LSP
			"tsserver", -- TS & JS LSP
			"pylsp", -- Python LSP
			"sqlls", -- SQL LSP
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

		lspconfig["tailwindcss"].setup({
			on_attach = on_attach,
			capabilities = lsp_defaults.capabilities,
			filetypes = { "templ", "astro", "javascript", "typescript", "react" },
			settings = {
				tailwindCSS = {
					includeLanguages = {
						templ = "html",
					},
				},
			},
		})

		lspconfig["templ"].setup({
			on_attach = templ_attach,
			capabilities = lsp_defaults.capabilities,
		})
	end,
}

return plugin
