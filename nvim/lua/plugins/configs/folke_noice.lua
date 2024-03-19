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
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
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

			-- you can enable a preset for easier configuration
			-- presets = {
			-- bottom_search = false, -- use a classic bottom cmdline for search
			-- command_palette = true, -- position the cmdline and popupmenu together
			-- long_message_to_split = true, -- long messages will be sent to a split
			-- inc_rename = false, -- enables an input dialog for inc-rename.nvim
			-- lsp_doc_border = true, -- add a border to hover docs and signature help
			-- },
		})
	end,
}

return plugin