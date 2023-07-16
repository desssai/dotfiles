local options = {
	ensure_installed = {
		-- LSP SERVERS
    -- "bashls",							            -- Bash LSP
		"clangd",							                -- C, C++ LSP
		"cmake-language-server",	            -- CMake LSP
		-- "dockerls",							          -- Docker LSP
		-- "docker_compose_language_service",	-- Docker-Compose LSP
		"gopls",							                -- Go LSP
		-- "sourcery",					              -- Python LSP
		"lua-language-server",	              -- Lua LSP
		"marksman",							              -- Markdown LSP
		-- "ltex",								            -- LaTeX LSP
    -- FORMATTING
    "clang-format",                       -- C, C++ Formatting
    "gofumpt",                            -- Go Formatting
    "golines",                            -- Go lines Formatting
    "goimports",                          -- Go imports Formatting

    -- DEBUGGINF
    "codelldb",                           -- C, C++ Debugger
	},
}

return options

