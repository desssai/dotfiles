local plugin = {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		--   `nvim-notify` is only needed, if you want to use the notification view.
	},
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			views = {
				cmdline_popup = {
					position = {
						row = "50%",
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					border = {
						style = "none",
						padding = { 1, 2 },
					},
				},
			},
			lsp = {
				override = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
		})
	end,
}

return plugin
