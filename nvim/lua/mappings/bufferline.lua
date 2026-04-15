local mappings = {
	n = {
		["<tab>"] = { "<cmd> BufferLineCycleNext <CR>", "Next buffer" },
		["<S-tab>"] = { "<cmd> BufferLineCyclePrev <CR>", "Previous buffer" },
	},
}

return mappings
