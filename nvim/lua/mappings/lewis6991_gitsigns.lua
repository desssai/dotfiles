local gs = require("gitsigns")

local mappings = {
	n = {

		-- Navigation through hunks
		["]c"] = {
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").next_hunk()
				end)
				return "<Ignore>"
			end,
			"Jump to next hunk",
			opts = { expr = true },
		},

		["[c"] = {
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end,
			"Jump to prev hunk",
			opts = { expr = true },
		},

		["<leader>ghs"] = { gs.stage_hunk, "Git stage current hunk" },
		["<leader>ghr"] = { gs.reset_hunk, "Git reset current hunk" },
		["<leader>ghu"] = { gs.undo_stage_hunk, "Git undo current hunk" },
		["<leader>ghp"] = { gs.preview_hunk, "Git preview current hunk" },
		["<leader>ghd"] = { gs.toggle_deleted, "Git toggle deleted" },
		["<leader>gl"] = { gs.toggle_current_line_blame, "Git toggle blame line" },
		["<leader>gd"] = { gs.diffthis, "Git toggle diff this" },
		["<leader>gD"] = {
			function()
				gs.diffthis("~")
			end,
			"Git toggle diff",
		},
	},
}

return mappings
