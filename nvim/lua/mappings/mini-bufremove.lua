local bdel = require('mini.bufremove')

local mappings = {
	i = {
		["<M-w>"] = { function() bdel.delete() end, "Close buffer" },
	},
	n = {
		["<M-w>"] = { function() bdel.delete() end, "Close buffer" },
	},
	v = {
		["<M-w>"] = { function() bdel.delete() end, "Close buffer" },
	}
}

return mappings
