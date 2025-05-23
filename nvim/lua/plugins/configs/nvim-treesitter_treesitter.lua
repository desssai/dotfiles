local plugin = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c", -- Mandatory TS package
				"lua", -- Mandatory TS package
				"vim", -- Mandatory TS package
				"vimdoc", -- Mandatory TS package
				"query", -- Mandatory TS package
				"bash",
				"regex",
				"csv",
				"css",
				"html",
				"templ",
				"javascript",
				"python",
				"cmake",
				"comment",
				"cpp",
				"dockerfile",
				"go",
				"json",
				"markdown",
				"markdown_inline",
				"sql",
				"hyprlang",
				"tsx",
			},

			highlight = {
				enable = true,
				use_languagetree = true,
			},
			-- indent = { enable = true },
		})
	end,
}

return plugin
