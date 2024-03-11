local plugin = {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("ibl").setup({
			enabled = true,
			debounce = 100, -- Set the amount of refreshed in ms
			indent = {
				char = { "┃" },
				highlight = { "Whitespace" },
			},
			scope = {
				show_start = false,
				show_end = false,
				highlight = { "Nontext" },
				include = {
					node_type = { ["*"] = { "*" } },
				},
			},
			exclude = {
				filetypes = {
					"lspinfo",
					"packer",
					"lazy",
					"checkhealth",
					"help",
					"man",
					"gitcommit",
					"TelescopePrompt",
					"TelescopeResults",
					"",
				},
			},
		})
	end,
}

return plugin
