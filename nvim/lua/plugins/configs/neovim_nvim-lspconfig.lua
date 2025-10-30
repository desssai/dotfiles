return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local function on_attach(client, bufnr)
			-- use null-ls formatter and not the default lsp behaviour
			-- disable semantic tokens so as to smooth the experience
			-- and set up custom mappings for each buffer on attach
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			client.server_capabilities.semanticTokensProvider = nil
			require("core.mappings").set("mappings.neovim_nvim-lspconfig", bufnr)
		end

		-- set default capabilities and on_attach for all language servers
		vim.lsp.config["*"] = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		local servers = {
			"bashls", -- Bash
			"clangd", -- C/C++
			"dockerls", -- Dockerfile
			"docker_compose_language_service", -- Docker Compose
			"marksman", -- Markdown
			"ts_ls", -- TypeScript/JavaScript
			"pylsp", -- Python
			"sqlls", -- SQL Language Server
		}

		for _, name in ipairs(servers) do
			vim.lsp.enable(name)
		end

		-- lua_ls
		vim.lsp.config["lua_ls"] = {
			on_attach = on_attach,
			capabilities = capabilities,
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end
			end,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					runtime = {
						version = "Lua 5.4",
						path = {
							"/usr/share/lua/5.4/?.lua",
							"/usr/local/share/lua/5.4/?.lua",
							"/usr/local/share/lua/5.4/?/init.lua",
							"/usr/share/lua/5.4/?/init.lua",
							"/usr/local/lib/lua/5.4/?.lua",
							"/usr/local/lib/lua/5.4/?/init.lua",
							"/usr/lib/lua/5.4/?.lua",
							"/usr/lib/lua/5.4/?/init.lua",
							"./?.lua",
							"./?/init.lua",
							"/home/ncarob/.luarocks/share/lua/5.4/?.lua",
							"/home/ncarob/.luarocks/share/lua/5.4/?/init.lua",
						},
					},
					workspace = {
						library = {
							vim.fn.expand("~/.luarocks/share/lua/5.4"),
							"/usr/share/lua/5.4",
						},
					},
				},
			},
		}
		vim.lsp.enable("lua_ls")

		-- gopls
		vim.lsp.config["gopls"] = {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = { unusedparams = true },
				},
			},
		}
		vim.lsp.enable("gopls")

		-- tailwindcss (add templ support)
		-- lspconfig.tailwindcss = {
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = { "templ", "astro", "javascript", "typescript", "react" },
		-- 	settings = {
		-- 		tailwindCSS = {
		-- 			includeLanguages = { templ = "html" },
		-- 		},
		-- 	},
		-- }

		local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
		local function templ_attach(client, bufnr)
			-- same baseline tweaks as others
			on_attach(client, bufnr)

			-- ensure we don't stack autocmds when servers restart
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

			vim.api.nvim_create_autocmd("BufWritePost", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					local filename = vim.api.nvim_buf_get_name(bufnr)
					-- nvim 0.11: prefer vim.system over jobstart
					vim.system({ "templ", "fmt", filename }, { text = true }, function()
						-- only reload if still on same buffer
						if vim.api.nvim_get_current_buf() == bufnr then
							vim.schedule(function()
								vim.cmd("e!")
							end)
						end
					end)
				end,
			})
		end

		-- templ
		vim.lsp.config["templ"] = {
			on_attach = templ_attach,
			capabilities = capabilities,
		}
		vim.lsp.enable("templ")
	end,
}
