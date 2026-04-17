local plugin = {
	name = "mason",
	url = "https://github.com/mason-org/mason.nvim",
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonUninstall",
		"MasonUninstallAll",
		"MasonLog",
	},
	opts = {
		ui = {
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = " ",
			},

			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "v",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},

		max_concurrent_installers = 10,
	},
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup(self.opts)

		local ensure_installed = {
			-- LSP SERVERS
			"bash-language-server",         -- Bash LSP
			"clangd",                       -- C, C++ LSP
			-- "cmake-language-server", -- CMake LSP
			"docker-language-server",   -- Docker & Compose LSP
			"gopls",                        -- Go LSP
			"lua-language-server",          -- Lua LSP
			"marksman",                     -- Markdown LSP
			"css-lsp",                      -- CSS LSP
			"typescript-language-server",   -- TS & JS LSP
			"templ",                        -- Golang HTML Templates LSP
			"python-lsp-server",            -- Python LSP
			"sqlls",                        -- SQL LSP
			"tailwindcss-language-server",  -- Tailwindcss LSP
			"html-lsp",                     -- HTML LSP

			-- LINTING
			"luacheck",

			-- FORMATTING
			"clang-format", -- C, C++ Formatting
			"stylua",    -- Lua Formatting
			"gofumpt",   -- Go Formatting
			"golines",   -- Go lines Formatting
			"goimports", -- Go imports Formatting
			"prettier",  -- HTML, CSS, JS Formatting
			"sqlfmt",    -- SQL Formatting
			"black",     -- Python Formatting

			-- DEBUGGING
			"delve", -- Go Debug server
			-- "codelldb", -- C, C++ Debugger
		}

		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
		end, {})
	end,
}

return plugin
