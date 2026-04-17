local oil = require('oil')

local mappings = {
	n = {
		["-"] = { function ()
			oil.open_float()
		end, "Open parent directory" }
	}
}

return mappings
