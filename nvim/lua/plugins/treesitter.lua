local plugin = {
	name = "nvim-treesitter",
	url = "https://github.com/nvim-treesitter/nvim-treesitter",
	setup = function(self)
		local parsers = {
			"c", "lua", "vim", "vimdoc", "query",
			"bash", "regex", "css", "html", "templ",
			"javascript", "python", "make", "cmake", "cpp",
			"dockerfile", "go", "markdown", "markdown_inline",
			"sql", "hyprlang", "tsx", "json", "csv", "yaml",
		}

		vim.cmd.packadd(self.name)

		require("nvim-treesitter").setup({})
		require("nvim-treesitter").install(parsers)

		local group = vim.api.nvim_create_augroup("TreeSitter", { clear = true })

		vim.api.nvim_create_autocmd("PackChanged", {
			group = group,
			callback = function(ev)
				local data = ev.data or {}
				local spec = data.spec or {}
				if spec.name == self.name and data.kind == "update" then
					vim.schedule(function()
						vim.cmd.packadd(self.name)
						vim.cmd("TSUpdate")
					end)
				end
			end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = "*",
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}

return plugin
