local plugin = {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "InsertEnter" },
	config = function()
		require("core.mappings").set("mappings.numtostr_comment")
		require("Comment").setup({
			padding = true,
			sticky = true,

			---Ignore blank lines
			ignore = "^$",

			-- The plugin won't create any mappings by itself
			mappings = {
				basic = false,
				extra = false,
			},
		})
		local ft = require("Comment.ft")
		ft.hyprlang = "# %s"
		ft.templ = "// %s"
	end,
}

return plugin
