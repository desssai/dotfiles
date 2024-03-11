local mappings = {
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle a debug breakpoint" },
		["<leader>dc"] = { "<cmd> DapContinue <CR>", "Start a debug session" },
		["<leader>dsi"] = { "<cmd> DapStepInto <CR>", "Dap Step Into" },
		["<leader>dso"] = { "<cmd> DapStepOver <CR>", "Dap Step Over" },
		["<leader>dsu"] = { "<cmd> DapStepOut <CR>", "Dap Step Out" },
		["<leader>dq"] = { "<cmd> DapTerminate <CR>", "Terminate the debug session" },
		["<leader>dd"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debug sidebar",
		},
	},
}

return mappings
