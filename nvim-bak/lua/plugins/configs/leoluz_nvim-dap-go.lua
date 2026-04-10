local plugin = {
	"leoluz/nvim-dap-go",
	ft = { "go" },
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		require("core.mappings").set("mappings.leoluz_nvim-dap-go")
		require("dap-go").setup()
	end,
}

return plugin
