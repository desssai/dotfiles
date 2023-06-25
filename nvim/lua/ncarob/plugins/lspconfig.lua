local status, lspconfig = pcall(require, 'lspconfig')
if not status then
	print('LSPCONFIG NOT FOUND!')
	return
end

local status, util = pcall(require, 'lspconfig.util')
if not status then
	print('LSPCONFIG_UTILS NOT FOUND!')
	return
end

local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status then
	print('MP_NVIM_LSP NOT FOUND')
	return
end

local status, inc_rename = pcall(require, 'inc_rename')
if not status then
	print('INC_RENAME NOT FOUND')
	return
end

inc_rename.setup({
	cmd_name = "IncRename", -- the name of the command
	hl_group = "Substitute", -- the highlight group used for highlighting the identifier's new name
  	preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
  	show_message = true, -- whether to display a `Renamed m instances in n files` message after a rename operation
  	input_buffer_type = nil, -- the type of the external input buffer to use (the only supported value is currently "dressing")
  	post_hook = nil, -- callback to run after renaming, receives the result table (from LSP handler) as an argument
})

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
  	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
  	keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- got to declaration
  	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- see definition and make edits in window
  	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- go to implementation
  	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- go to implementation
  	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
  	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
  	keymap.set("n", "<leader>rn", ":IncRename ", opts) -- smart rename
  	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
  	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
  	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
  	keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
  	keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig['clangd'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { 'clangd' },
	filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
	root_dir = util.root_pattern(
		'.clangd',
		'.clang-tidy',
		'.clang-format',
		'compile_commands.json',
		'compile_flags.txt',
		'configure.ac',
		'.git'
	),
	single_file_support = true,
})

lspconfig['cmake'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	init_options = { buildDirectory = "build" },
	root_dir = util.root_pattern(
		'CMakePresets.json',
		'CTestConfig.cmake',
		'.git',
		'build',
		'cmake'
	),
	single_file_support = true,
})

lspconfig['gopls'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern(
		'go.work',
		'go.mod',
		'.git'
	),
	single_file_support = true,
})

lspconfig['lua_ls'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	log_level = 2,
	root_dir = util.root_pattern(
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git"
	),
	settings = {
		Lua = {
			telemetry = {
				enable = false
			},
			diagnostics = {
				globals = { 'vim' },
			}
		}
	},
	single_file_support = true,
})

lspconfig['marksman'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "marksman", "server" },
	filetypes = { "markdown" },
	root_dir = util.root_pattern(
		'.marksman.toml',
		'.git'
	),
	single_file_support = true,
})

