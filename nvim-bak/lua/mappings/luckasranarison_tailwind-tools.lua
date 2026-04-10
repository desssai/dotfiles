local mappings = {
	n = {
		["<leader>th"] = { "<cmd>TailwindConcealToggle<cr>", "Toggle tailwind classes" },
		["<leader>tc"] = { "<cmd>TailwindColorToggle<cr>", "Toggle tailwind colors" },
		["<leader>ts"] = { "<cmd>TailwindSort<cr>", "Sort tailwind classes" },
	},

	v = {
		["<leader>ts"] = { "<cmd>TailwindSortSelection<cr>", "Sort selected tailwind classes" },
	},
}

return mappings
