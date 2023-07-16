local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.marksman.setup({
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

lspconfig.clangd.setup({
	on_attach = function (client, bufnr)
	  client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	cmd = { 'clangd', "--offset-encoding=utf-16" },
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

lspconfig.cmake.setup({
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

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern(
		'go.work',
		'go.mod',
		'.git'
	),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
	single_file_support = true,
})

