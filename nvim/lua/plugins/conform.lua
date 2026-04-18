local plugin = {
	src = 'https://github.com/stevearc/conform.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	setup = function()
		local enabled = true

		require('conform').setup({
			format_on_save = function(_)
				if enabled == false then
					return
				end

				return {
					timeout_ms = 5000,
					lsp_format = 'fallback',
				}
			end,
			formatters_by_ft = {
				python = { 'black' },
				c = { 'clang-format' },
				cpp = { 'clang-format' },
				lua = { 'stylua' },
				rust = { 'rustfmt' },
				templ = { 'templ' },
				go = { 'golines', 'goimport', 'gofumpt' },
				sql = { 'sqlfmt' },
				css = { 'prettier' },
				json = { 'prettier' },
				yaml = { 'prettier' },
				javascript = { 'prettier' },
				typescript = { 'prettier' },
			},
			formatters = {
				['clang-format'] = {
					prepend_args = { '-style=file', '-fallback-style=LLVM' },
				},
			},
		})
	end,
}

return plugin
