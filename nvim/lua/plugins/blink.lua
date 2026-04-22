local plugin = {
	deps = {
		{
			src = 'https://github.com/rafamadriz/friendly-snippets',
		},
		{
			src = 'https://github.com/nvim-mini/mini.snippets',
			setup = function()
				local gen_loader = require('mini.snippets').gen_loader
				require('mini.snippets').setup({
					snippets = {
						gen_loader.from_file('~/.config/nvim/snippets/global.json'),
						gen_loader.from_lang({
							lang_patterns = {
								templ = {
									'templ/**/*.json',
									'templ/**/*.lua',
									'**/templ.json',
									'**/templ.lua',

									'html/**/*.json',
									'html/**/*.lua',
									'**/html.json',
									'**/html.lua',
								},
							},
						}),
					},
					mappings = {
						expand = '<C-s>',
						jump_next = '<Tab>',
						jump_prev = '<S-Tab>',
						stop = '<C-c>',
					},
					-- `MiniSnippets.default_<field>()` default when `nil`.
					expand = {
						prepare = nil, -- Resolve raw config snippets at context
						match = nil, -- Match resolved snippets at cursor position
						select = nil, -- Possibly choose among matched snippets
						insert = nil, -- Insert selected snippet
					},
				})
			end,
		},
	},
	src = 'https://github.com/Saghen/blink.cmp',
	init = function()
		local group = vim.api.nvim_create_augroup('BlinkBuild', { clear = true })

		vim.api.nvim_create_autocmd('PackChanged', {
			group = group,
			callback = function(ev)
				local data = ev.data or {}
				local spec = data.spec or {}
				if spec.name == 'blink.cmp' and data.kind == 'update' then
					vim.schedule(function()
						vim.cmd('BlinkCmp build')
					end)
				end
			end,
		})
	end,
	setup = function()
		require('blink.cmp').setup({
			keymap = {
				['<C-e>'] = { 'hide', 'show', 'fallback' },
				['<C-y>'] = { 'select_and_accept', 'fallback' },
				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },
				['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
				['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
				['<C-b>'] = { 'scroll_signature_up', 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_signature_down', 'scroll_documentation_down', 'fallback' },
				['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			},
			appearance = {
				nerd_font_variant = 'mono',
				kind_icons = require('core.icons').lsp_kind,
			},
			completion = {
				trigger = {
					show_on_keyword = true,
					show_on_trigger_character = true,
					show_on_insert_on_trigger_character = true,
					show_on_backspace_in_keyword = false,
				},
				list = { selection = { preselect = true, auto_insert = false } },
				menu = {
					border = 'none',
					scrollbar = false,
					scrolloff = 2,
					draw = {
						gap = 2,
						columns = {
							{ 'label', 'label_description', gap = 1 },
							{ 'kind_icon', 'kind', gap = 1 },
							{ 'source_name' },
						},
						components = {
							kind_icon = {
								text = function(ctx)
									return require('core.icons').lsp_kind[ctx.kind]
								end,
							},
							source_name = {
								text = function(ctx)
									return '[' .. ctx.source_name:sub(1, 1) .. ']'
								end,
							},
						},
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 50,
					update_delay_ms = 50,
					window = { border = 'solid' },
				},
			},
			snippets = { preset = 'mini_snippets' },
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					lsp = {
						fallbacks = {},
						max_items = 5,
					},
					path = {
						fallbacks = {},
						max_items = 5,
					},
					snippets = {
						score_offset = 5,
						max_items = 5,
					},
					buffer = {
						max_items = 5,
					},
				},
			},
			signature = { enabled = true, window = { border = 'solid' } },
			fuzzy = { implementation = 'prefer_rust_with_warning' },
			cmdline = {
				enabled = true,
				keymap = { preset = 'default' },
				completion = {
					menu = { auto_show = true },
				},
			},
		})
	end,
}

return plugin
