local plugin = {
	"folke/zen-mode.nvim",
	cmd = { "ZenMode" },
	init = function()
		require("core.mappings").set("mappings.folke_zen-mode")
	end,
	opts = {
		window = {
			backdrop = 0.9, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 0.80, -- width of the Zen window
			height = 1, -- height of the Zen window
			options = {
				-- signcolumn = "no", -- disable signcolumn
				-- number = false, -- disable number column
				-- relativenumber = false, -- disable relative numbers
				-- cursorline = false, -- disable cursorline
				-- cursorcolumn = false, -- disable cursor column
				-- foldcolumn = "0", -- disable fold column
				-- list = false, -- disable whitespace characters
			},
		},
		plugins = {
			-- disable some global vim options (vim.o...)
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
				-- you may turn on/off statusline in zen mode by setting 'laststatus'
				-- statusline will be shown only if 'laststatus' == 3
				laststatus = 3, -- turn off the statusline in zen mode
			},
			twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = false }, -- disables git signs
			-- tmux = { enabled = false }, -- disables the tmux statusline
			-- kitty = {
			-- 	enabled = false,
			-- 	font = "+4", -- font size increment
			-- },
			-- alacritty = {
			-- 	enabled = false,
			-- 	font = "14", -- font size
			-- },
			-- wezterm = {
			-- 	enabled = false,
			-- 	font = "+4", -- (10% increase per step)
			-- },
		},
		-- callback where you can add custom code when the Zen window opens
		-- on_open = function(win)
		-- end,
		-- callback where you can add custom code when the Zen window closes
		-- on_close = function()
		-- end,
	},
}

return plugin
