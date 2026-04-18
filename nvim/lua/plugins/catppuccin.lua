local plugin = {
	src = 'https://github.com/catppuccin/nvim',
	setup = function()
		require('catppuccin').setup({
			flavour = 'macchiato', -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = 'latte',
				dark = 'mocha',
			},
			transparent_background = true, -- disables setting the background color.
			-- custom_highlights = function(colors)
			-- 	return {
			-- 		Normal = { bg = colors.base },
			-- 		NormalFloat = { bg = colors.crust },
			-- 		LineNr = { fg = colors.peach },
			-- 		Comment = { fg = colors.overlay1 },
			-- 		Pmenu = { bg = colors.mantle },
			-- 		PmenuSel = { fg = colors.mantle, bg = colors.blue },
			-- 		NoiceCmdlinePopup = { bg = colors.mantle },
			-- 		FzfLuaPreviewNormal = { bg = colors.mantle },
			-- 	}
			-- end,
			integrations = {
				default_integrations = true,
				-- dap = true,
				-- dap_ui = true,
				fzf = true,
				mini = true,
				mason = true,
				gitsigns = true,
				lsp_trouble = true,
				which_key = true,
				treesitter = true,
				-- neotree = true,
				-- notify = false,
			},
		})
		vim.cmd.colorscheme('catppuccin')
	end,
}

return plugin
