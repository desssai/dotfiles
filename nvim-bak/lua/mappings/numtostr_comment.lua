local api = require("Comment.api")

local mappings = {
	n = {
		["<leader>/"] = {
			function()
				api.toggle.linewise.current()
			end,
			"Toggle comment for current line",
		},
		["cO"] = {
			function()
				api.insert.linewise.above()
			end,
			"Add comment above the current line",
		},
		["co"] = {
			function()
				api.insert.linewise.below()
			end,
			"Add comment below the current line",
		},
		["cA"] = {
			function()
				api.insert.linewise.eol()
			end,
			"Add comment after the current line",
		},
		["cs"] = { api.call("toggle.linewise", "g@"), "Comment toggle operator", opts = { expr = true } },
		["cb"] = { api.call("toggle.blockwise", "g@"), "Comment toggle operator", opts = { expr = true } },
	},

	v = {
		["<leader>/"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"Toggle comment for selected lines",
		},
	},
}

return mappings
