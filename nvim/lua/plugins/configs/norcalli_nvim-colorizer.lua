local plugin = {
	"norcalli/nvim-colorizer.lua",
	cmd = { "ColorizerToggle" },
	init = function()
		require("core.mappings").set("mappings.norcalli_nvim-colorizer")
	end,
}

return plugin
