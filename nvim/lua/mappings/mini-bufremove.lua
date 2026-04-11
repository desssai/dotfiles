local bdel = require('mini.bufremove')

local mappings = {
	n = {
		["<M-q>"] = { function() bdel.delete() end, "Close buffer" },
	},
	v = {
		["<M-q>"] = { function() bdel.delete() end, "Close buffer" },
	}
}

return mappings
