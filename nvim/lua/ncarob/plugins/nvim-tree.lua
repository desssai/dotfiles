local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	print("NVIM-TREE NOT FOUND!")
	return
end

-- reccomended settings from documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to orange blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#FF9248 ]])

nvimtree.setup({
	
	git = {
		enable = true,
	},

	-- change folder arrow icons
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
			glyphs = {
				folder = {
					arrow_closed = '➡', -- arrow when folder is closed
					arrow_open = "⬇", -- arrow when folder is open
				},
			},
		},
	},
	
	-- disable window_picker for explorer to work well with window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
