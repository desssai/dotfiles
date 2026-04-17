local plugin = {
	name = "blink.cmp",
	url = "https://github.com/Saghen/blink.cmp",
	opts = {
		keymap = {
			['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
			['<C-e>'] = { 'hide', 'fallback' },
			['<C-y>'] = { 'select_and_accept', 'fallback' },
			['<Up>'] = { 'select_prev', 'fallback' },
			['<Down>'] = { 'select_next', 'fallback' },
			['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
			['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
			['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
			['<Tab>'] = { 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },
			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
		},
		appearance = {
			nerd_font_variant = 'mono',
			kind_icons = require('core.icons').lsp_kind,
		},
		completion = {
			trigger = {
				show_on_keyword = true,
				show_on_backspace_in_keyword = false,
			},
			menu = {
				border = "none",
				draw = {
					gap = 2,
					columns = {
						{ 'kind_icon',  'label', 'label_description', gap = 1, },
						{ 'kind' },
						{ 'source_name' }
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
				update_delay_ms = 50,
				window = { border = "solid" },
			},
		},
		-- snippets = { preset = 'mini_snippets' },
		sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
		signature = { enabled = true, window = { border = "none" } },
		fuzzy = { implementation = "prefer_rust_with_warning" },

		cmdline = {
			enabled = true,
			keymap = { preset = 'default' },
			completion = {
				menu = { auto_show = true },
			},
			-- sources = { default = { 'cmdline' } },
		},
	},
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup(self.opts)
	end
}

return plugin
