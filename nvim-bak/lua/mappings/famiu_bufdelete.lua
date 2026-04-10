local mappings = {
	i = {
		["<C-q>"] = {
			function()
				require("bufdelete").bufdelete(0, true)
			end,
			"Close current buffer with force",
		},
	},
	n = {
		["<C-q>"] = {
			function()
				require("bufdelete").bufdelete(0, true)
			end,
			"Close current buffer with force",
		},
	},
	v = {
		["<C-q>"] = {
			function()
				require("bufdelete").bufdelete(0, true)
			end,
			"Close current buffer with force",
		},
	},
}

return mappings
