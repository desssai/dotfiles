local mappings = {

	i = {
		-- Go to  beginning and end
		["<C-a>"] = { "<ESC>^i", "Beginning of line" },
		["<C-e>"] = { "<End>", "End of line" },

		-- Cycle diagnostic buffers
		["<C-j>"] = { "<cmd> cnext <CR>", "Next diagnostics buffer" },
		["<C-k>"] = { "<cmd> cprev <CR>", "Previous diagnostics buffer" },

		-- Leave insert mode
		["jk"] = { "<ESC>", "Leave insert mode" },
	},

	n = {
		-- Clear search highlights
		["<Esc>"] = { ":noh <CR>", "Clear search highlights" },

		-- Rename word under cursor
		["<leader>rn"] = { ":%s/<C-r><C-w>//g<Left><Left>", "Rename references of word under cursor in current buffer" },

		-- Go to  beginning and end
		["<C-a>"] = { "<ESC>^i", "Beginning of line" },
		["<C-e>"] = { "<End>a", "End of line" },

		-- Cycle diagnostic buffers
		["<C-j>"] = { "<cmd> cnext <CR>", "Next diagnostics buffer" },
		["<C-k>"] = { "<cmd> cprev <CR>", "Previous diagnostics buffer" },

		-- Switch Between Windows as Fallback
		["<M-h>"] = { "<C-w>h", "Window left" },
		["<M-l>"] = { "<C-w>l", "Window right" },
		["<M-j>"] = { "<C-w>j", "Window down" },
		["<M-k>"] = { "<C-w>k", "Window up" },

		-- Toggle Line Numbers
		["<leader>nn"] = { "<cmd> set nu! <CR>", "Toggle line number" },
		["<leader>nr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

		-- Buffer Management
		["<C-n>"] = { "<cmd> enew <CR>", "New buffer" },
		["<C-s>"] = { "<cmd> w <CR>", "Save buffer" },
		["<C-y>"] = { "<cmd> %y+ <CR>", "Copy whole buffer" },
		["<tab>"] = { "<cmd> bn <CR>", "Next buffer" },
		["<S-tab>"] = { "<cmd> bp <CR>", "Previous buffer" },

		-- Window Management
		["<leader>q"] = { "<cmd> close <CR>", "Close current window" },
		["<leader>\\"] = { "<C-w>v", "Split windows vertically" },
		["<leader>-"] = { "<C-w>s", "Split windows horizontally" },
		["<leader>b"] = { "<C-w>=", "Balance open windows" },
	},

	v = {
		-- Rename word under cursor
		["<leader>rn"] = {
			":s/<C-r><C-w>//g<Left><Left>",
			"Rename references of word under selection start in selection",
		},
	},

	t = {
		["<C-q>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
	},

	x = {
		["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
	},
}

return mappings
