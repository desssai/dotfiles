local plugin = {
	"catppuccin/nvim",
	lazy = false,
	name = "catpuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			-- show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			-- term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			-- dim_inactive = {
			--     enabled = false,
			--     shade = "dark",
			--     percentage = 0.15,
			-- },
			-- no_italic = false,
			-- no_bold = false,
			-- no_underline = false,
			-- styles = { -- (see `:h highlight-args`):
			-- 	comments = { "italic" },
			-- 	conditionals = { "italic" },
			-- 	loops = {},
			-- 	functions = {},
			-- 	keywords = {},
			-- 	strings = {},
			-- 	variables = {},
			-- 	numbers = {},
			-- 	booleans = {},
			-- 	properties = {},
			-- 	types = {},
			-- 	operators = {},
			-- },
			-- color_overrides = {}
			custom_highlights = function(colors)
				return {
					LineNr = { fg = colors.peach },
					Comment = { fg = colors.overlay1 },

					Pmenu = { bg = colors.mantle },
					PmenuSel = { fg = colors.mantle, bg = colors.blue },

					NoiceCmdlinePopup = { bg = colors.mantle },

					TelescopeNormal = { bg = colors.base },
					TelescopeBorder = { bg = colors.base },
					TelescopeTitle = { bg = colors.base },
					TelescopeSelection = { fg = colors.base, bg = colors.blue },

					NormalFloat = { bg = colors.base },
				}
			end,
			integrations = {
				default_integrations = false,
				dap = true,
				dap_ui = true,
				cmp = true,
				noice = true,
				mason = true,
				lsp_trouble = true,
				neotree = true,
				gitsigns = true,
				which_key = true,
				treesitter = true,
				notify = false,
				mini = false,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}

return plugin
