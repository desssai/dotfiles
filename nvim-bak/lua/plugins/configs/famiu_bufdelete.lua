local plugin = {
	"famiu/bufdelete.nvim",
	event = { "BufReadPre", "InsertEnter" },
	config = function()
		require("core.mappings").set("mappings.famiu_bufdelete")
	end,
}

return plugin
