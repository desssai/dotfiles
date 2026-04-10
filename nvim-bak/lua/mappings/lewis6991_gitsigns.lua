local gs = require("gitsigns")

local mappings = {
	n = {
		["]c"] = {
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gs.nav_hunk("next")
				end
			end,
			"Jump to next hunk",
			opts = { expr = true },
		},

		["[c"] = {
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gs.nav_hunk("prev")
				end
			end,
			"Jump to prev hunk",
			opts = { expr = true },
		},

		["<leader>hs"] = { gs.stage_hunk, "Git stage current hunk" },
		["<leader>hS"] = { gs.stage_buffer, "Git stage current buffer" },
		["<leader>hr"] = { gs.reset_hunk, "Git reset current hunk" },
		["<leader>hR"] = { gs.reset_buffer, "Git reset current buffer" },
		["<leader>hu"] = { gs.undo_stage_hunk, "Git undo current hunk" },
		["<leader>hp"] = { gs.preview_hunk, "Git preview hunk" },
		["<leader>hi"] = { gs.preview_hunk_inline, "Git preview hunk inline" },
		-- ["<leader>hd"] = { gs.toggle_deleted, "Git toggle deleted" },
		["<leader>hl"] = { gs.blame_line({ full = true }), "Git toggle blame line" },
		["<leader>hd"] = { gs.diffthis, "Git toggle diff this" },
		["<leader>hD"] = {
			function()
				gs.diffthis("~")
			end,
			"Git toggle diff",
		},
		["<leader>hq"] = { gs.setqflist, "Set QF list" },
		["<leader>hQ"] = {
			function()
				gs.setqflist("all")
			end,
			"Set -a QF list",
		},
	},
	v = {
		["<leader>hs"] = {
			function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			"Git stage current hunk",
		},
		["<leader>hr"] = {
			function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			"Git reset current hunk",
		},
	},
}

return mappings
