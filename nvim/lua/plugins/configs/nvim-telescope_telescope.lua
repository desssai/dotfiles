local plugin = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-telescope/telescope-media-files.nvim" },
	},
	cmd = "Telescope",
	init = function()
		require("core.mappings").set("mappings.nvim-telescope_telescope")
	end,
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { "node_modules" },
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				border = true,
				borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },

				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					n = {
						["q"] = require("telescope.actions").close,
						["<C-d>"] = require("telescope.actions").preview_scrolling_down,
						["<C-f>"] = require("telescope.actions").preview_scrolling_up,
					},
				},
			},
			extensions = {
				media_files = {
					-- filetypes whitelist defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "svg" },
					-- find command (defaults to `fd`)
					find_cmd = "rg",
				},
			},
			extensions_list = { "noice", "media_files" },
		})
		require("telescope").load_extension("media_files")
	end,
}

return plugin
