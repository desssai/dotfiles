local plugin = {
	"catppuccin/nvim",
	lazy = false,
	name = "catpuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
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
			-- comments = { "italic" },
			--     conditionals = { "italic" },
			--     loops = {},
			--     functions = {},
			--     keywords = {},
			--     strings = {},
			--     variables = {},
			--     numbers = {},
			--     booleans = {},
			--     properties = {},
			--     types = {},
			--     operators = {},
			-- },
			-- color_overrides = {},
			-- custom_highlights = {},
			integrations = {
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
