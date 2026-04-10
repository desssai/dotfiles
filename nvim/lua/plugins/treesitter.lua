local plugin = {
	name = "nvim-treesitter",
	url = "https://github.com/nvim-treesitter/nvim-treesitter",
	setup = function(self)
		vim.cmd.packadd(self.name)

		local parsers = {
			"c",   -- Mandatory TS package
			"lua", -- Mandatory TS package
			"vim", -- Mandatory TS package
			"vimdoc", -- Mandatory TS package
			"query", -- Mandatory TS package
			"bash",
			"regex",
			"css",
			"html",
			"templ",
			"javascript",
			"python",
			"make",
			"cmake",
			"cpp",
			"dockerfile",
			"go",
			"markdown",
			"markdown_inline",
			"sql",
			"hyprlang",
			"tsx",
			"json",
			"csv",
			"yaml",
		}

		require(self.name).setup({
			ensure_installed = parsers,
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = {
				enable = true
			},
		})

		local group = vim.api.nvim_create_augroup("TreeSitter", { clear = true })
		vim.api.nvim_create_autocmd('PackChanged', {
			group = group,
			callback = function(ev)
				local name, kind = ev.data.spec.name, ev.data.kind
				if name == self.name and kind == 'update' then
					vim.cmd('TSUpdate')
				end
			end
		})

		local filetypes = {}
		for _, parser in ipairs(parsers) do
			local patterns = vim.treesitter.language.get_filetypes(parser)
			for _, pattern in ipairs(patterns) do
				table.insert(filetypes, pattern)
			end
		end

		vim.api.nvim_create_autocmd('FileType', {
			group = group,
			pattern = filetypes,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}

return plugin
