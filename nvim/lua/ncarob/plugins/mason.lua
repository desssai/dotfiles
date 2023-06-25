local status, mason = pcall(require, "mason")
if not status then
	print("MASON NOT FOUND!")
	return
end

local status, mason_lsp = pcall(require, "mason-lspconfig")
if not status then
	print("MASON-LSP NOT FOUND!")
	return
end

mason.setup()

mason_lsp.setup({
	
	ensure_installed = {
		-- "bashls",							-- Bash
		"clangd",							-- C, C++
		"cmake",							-- CMake
		-- "dockerls",							-- Docker
		-- "docker_compose_language_service",	-- Docker-Compose
		"gopls",							-- Go
		-- "sourcery",							-- Python
		"lua_ls",							-- Lua
		"marksman",							-- Markdown
		-- "ltex",								-- LaTeX
	},
	
	automatic_installation = false,
	handlers = nil,
})
