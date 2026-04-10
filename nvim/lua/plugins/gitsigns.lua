local plugin = {
	name = "gitsigns",
	url = "https://github.com/lewis6991/gitsigns.nvim",
	lazy = true,
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "󰍵" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "?" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "󰍵" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "?" },
		},
		signs_staged_enable = true,
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = false,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		blame_formatter = nil, -- Use default
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		on_attach = function(bufnr)
			require("core.mappings").set("mappings.gitsigns", bufnr)
		end,
	},
	init = function(self)
		local group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true })

		local function is_git_repo(path)
			if path == "" then
				return false
			end

			local dir = vim.fs.dirname(path)
			return vim.fs.find(".git", { path = dir, upward = true })[1] ~= nil
		end

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
			group = group,
			callback = function(args)
				local buf = args.buf

				if vim.bo[buf].buftype ~= "" then
					return
				end

				local path = vim.api.nvim_buf_get_name(buf)
				if not is_git_repo(path) then
					return
				end

				vim.api.nvim_del_augroup_by_id(group)
				self:setup()
			end,
		})
	end,
	setup = function(self)
		vim.cmd.packadd(self.name)
		require(self.name).setup(self.opts)
	end,
}

return plugin
