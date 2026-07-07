local plugin = {
	src = 'https://github.com/catppuccin/nvim',
	setup = function()
		local colors_path =
			vim.fn.expand('~/.local/state/quickshell/user/generated/nvim_colors.lua')
		local ok, m = pcall(dofile, colors_path)
		if not ok then
			m = nil
		end

		require('catppuccin').setup({
			flavour = 'macchiato', -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = 'latte',
				dark = 'mocha',
			},
			color_overrides = m and {
				all = {
					-- Surface stack from Material (editor + panels only)
					base = m.background,
					mantle = m.surface_container_low,
					crust = m.surface_container_lowest,
					surface0 = m.surface_container,
					surface1 = m.surface_container_high,
					surface2 = m.surface_container_highest,
					-- syntax palette (mauve/sky/green/blue/peach/pink/etc.) left alone
				},
			} or {},
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
			custom_highlights = m and function()
				return {
					-- Editor chrome
					StatusLine = { fg = m.on_surface, bg = m.surface_container },
					StatusLineNC = { fg = m.on_surface_variant, bg = m.surface_container_low },
					WinBar = { fg = m.on_surface, bg = 'NONE' },
					WinSeparator = { fg = m.outline_variant },
					CursorLine = { bg = m.surface_container },
					Visual = { bg = m.secondary_container },
					LineNr = { fg = m.outline_variant },
					CursorLineNr = { fg = m.primary, bold = true },

					-- Floats (LSP hover, diagnostics, etc.)
					NormalFloat = { bg = m.surface_container_low },
					FloatBorder = { fg = m.outline, bg = m.surface_container_low },
					FloatTitle = { fg = m.primary, bold = true },

					-- Pmenu (completion)
					Pmenu = { bg = m.surface_container },
					PmenuSel = { bg = m.primary_container, fg = m.on_primary_container },
					PmenuSbar = { bg = m.surface_container_high },
					PmenuThumb = { bg = m.primary },

					-- Telescope / fzf-lua accents
					TelescopeBorder = { fg = m.outline },
					TelescopeTitle = { fg = m.primary, bold = true },
					TelescopePromptTitle = { fg = m.on_primary_container, bg = m.primary_container },
					TelescopeSelection = {
						bg = m.secondary_container,
						fg = m.on_secondary_container,
					},
					FzfLuaTitle = { fg = m.primary, bold = true },
					FzfLuaBorder = { fg = m.outline },

					-- Gitsigns
					GitSignsAdd = { fg = m.tertiary },
					GitSignsChange = { fg = m.primary },
					GitSignsDelete = { fg = m.error },

					-- Diagnostics (Material's error is the good one; keep Catppuccin's warn/info/hint)
					DiagnosticError = { fg = m.error },

					-- Optional: tree-sitter highlights that should track the accent rather than
					-- stay static. Leave syntax alone otherwise.
					-- ["@variable.member"] = { fg = m.primary },
				}
			end or nil,
			--
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
