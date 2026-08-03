local plugin = {
	src = 'https://github.com/ibhagwan/fzf-lua',
	cmd = { 'FzfLua' },
	init = function()
		require('core.mappings').set('mappings.fzf-lua')
	end,
	setup = function()
		local fzflua = require('fzf-lua')
		local actions = fzflua.actions
		local utils = require('fzf-lua.utils')

		-- flags for each tool, kept as exact strings so they can be matched/toggled
		local fd_exclude = "--exclude '*_templ.go' --exclude 'internal/db'"
		local rg_exclude = '-g "!*_templ.go" -g "!**/internal/db/**"'

		local function make_toggle(flag)
			return {
				fn = function(_, opts)
					actions.toggle_flag(_, vim.tbl_extend('force', opts, { toggle_flag = flag }))
				end,
				desc = 'toggle-generated-files',
				header = function(o)
					if o.cmd and o.cmd:match(utils.lua_regex_escape(flag)) then
						return 'Hide generated files'
					else
						return 'Show generated files'
					end
				end,
			}
		end

		fzflua.setup({
			winopts = {
				border = 'none',
				backdrop = 60,
				winblend = 5,
				preview = {
					border = 'none',
					winopts = { winblend = 5 },
				},
			},
			fzf_colors = true,
			keymap = {
				builtin = {
					['<c-f>'] = 'preview-page-down',
					['<c-b>'] = 'preview-page-up',
					['<c-d>'] = 'preview-down',
					['<c-u>'] = 'preview-up',
				},
				fzf = {
					['ctrl-q'] = 'select-all+accept',
				},
			},
			files = {
				fd_opts = ('--color=never --type f --type l --exclude .git --exclude .jj %s'):format(
					fd_exclude
				),
				rg_opts = ('--color=never --files -g "!.git" -g "!.jj" %s'):format(rg_exclude),
				actions = {
					['alt-h'] = make_toggle(fd_exclude), -- adjust to rg_exclude if you don't have fd installed
				},
			},
			grep = {
				rg_opts = ('--column --line-number --no-heading --color=always --smart-case --max-columns=4096 %s -e'):format(
					rg_exclude
				),
				actions = {
					['alt-h'] = make_toggle(rg_exclude),
				},
			},
		})
		fzflua.register_ui_select()
	end,
}

return plugin
