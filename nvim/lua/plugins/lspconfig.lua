local plugin = {
	name = "lspconfig",
	url = "https://github.com/neovim/nvim-lspconfig",
	setup = function(self)
		vim.cmd.packadd(self.name)


		local capabilities = vim.tbl_deep_extend("force",
			vim.lsp.protocol.make_client_capabilities(),
			require("blink.cmp").get_lsp_capabilities()
		)

		local function on_attach(_, bufnr)
			require("core.mappings").set("mappings.lspconfig", bufnr)
		end

		-- set default capabilities and on_attach for all language servers
		vim.lsp.config["*"] = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		local servers = {
			"bashls",                       -- Bash
			"clangd",                       -- C/C++
			"dockerls",                     -- Dockerfile
			"docker_compose_language_service", -- Docker Compose
			"marksman",                     -- Markdown
			"ts_ls",                        -- TypeScript/JavaScript
			"pylsp",                        -- Python
			"sqlls",                        -- SQL Language Server
			"cssls",                          -- CSS Language Server
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

		vim.lsp.config["html"] = {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "templ" },
		}
		vim.lsp.enable("html")

		-- vim.lsp.config["htmx"] = {
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = { "html", "templ" },
		-- }
		-- vim.lsp.enable("htmx")

		vim.lsp.config["tailwindcss"] = {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "templ", "javascript", "typescript", "react" },
			settings = {
				tailwindCSS = {
					includeLanguages = {
						templ = "html",
					},
				},
			},
		}
		vim.lsp.enable("tailwindcss")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
		local function templ_attach(client, bufnr)
			on_attach(client, bufnr)
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function(args)
					local filename = vim.api.nvim_buf_get_name(args.buf)
					if filename == "" then
						return
					end
					local result = vim.system({ "templ", "fmt", filename }, { text = true }):wait()
					if result.code ~= 0 then
						vim.notify(("templ fmt failed:\n%s"):format(result.stderr or ""), vim.log.levels.ERROR)
						return
					end
					if vim.api.nvim_buf_is_valid(args.buf) and vim.api.nvim_buf_is_loaded(args.buf) then
						vim.cmd("checktime " .. args.buf)
					end
				end,
			})
		end

		vim.lsp.config["templ"] = {
			on_attach = templ_attach,
			capabilities = capabilities,
			filetypes = { "templ" },
		}
		vim.lsp.enable("templ")
	end,
}

return plugin
