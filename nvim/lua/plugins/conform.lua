local plugin = {
	src = 'https://github.com/stevearc/conform.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	init = function()
		require('core.mappings').set('mappings.conform')
	end,
	setup = function()
		local enabled = true

		vim.api.nvim_create_user_command('ConformToggle', function(_)
			enabled = not enabled
		end, {})

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
