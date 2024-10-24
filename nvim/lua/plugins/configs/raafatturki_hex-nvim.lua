local plugin = {
	"RaafatTurki/hex.nvim",
	cmd = {
		"HexToggle",
	},
	init = function()
		require("core.mappings").set("mappings.raafatturki_hex-nvim")
	end,
	config = function()
		require("hex").setup()
	end,
}

return plugin
