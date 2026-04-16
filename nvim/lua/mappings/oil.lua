local oil = require('oil')

local mappings = {
	n = {
		["-"] = { function ()
			oil.toggle_float()
		end, "Open parent directory" }
	}
}

return mappings
