local setup1, telescope = pcall(require, "telescope")
if not setup1 then
	print("TELESCOPE NOT FOUND!")
	return
end

local setup2, actions = pcall(require, "telescope.actions")
if not setup2 then
	print("TELESCOPE ACTIONS NOT FOUND!")
	return
end

local setup3, themes = pcall(require, "telescope.themes")
if not setup3 then
	print("TELESCOPE_UI_SELECT NOT FOUND")
	return
end

telescope.setup{

	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				["<C-p>"] = actions.move_selection_previous,
        		["<C-n>"] = actions.move_selection_next,
        		["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},

	pickers = {
		--
	},

	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
      		override_generic_sorter = true,  -- override the generic sorter
      		override_file_sorter = true,     -- override the file sorter
      		case_mode = "smart_case"
    	},
		['ui-select'] = {
			themes.get_dropdown { }
		}
	},
}

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
