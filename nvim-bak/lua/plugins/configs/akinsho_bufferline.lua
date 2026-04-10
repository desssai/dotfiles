local plugin = {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = { "BufReadPre", "BufWinEnter", "BufNewFile" },
	config = function()
		require("bufferline").setup({
			options = {
				style_preset = require("bufferline").style_preset.no_italic,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return " " .. icon .. count
				end,
				color_icons = true,
				show_buffer_icons = true,
				separator_style = "thin",
			},
		})
	end,
}

return plugin
