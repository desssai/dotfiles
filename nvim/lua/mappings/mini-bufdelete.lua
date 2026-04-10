local bdel = require('mini.bufdelete')

local mappings = {
	n = {
		["<M-q>"] = { function() bdel.delete() end, "Close buffer" },
	},
	v = {
		["<M-q>"] = { function() bdel.delete() end, "Close buffer" },
	}
}

return mappings
