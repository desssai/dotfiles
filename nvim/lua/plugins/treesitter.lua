local plugin = {
	src = 'https://github.com/nvim-treesitter/nvim-treesitter',
	init = function()
		local group = vim.api.nvim_create_augroup('TreeSitterBuild', { clear = true })

		vim.api.nvim_create_autocmd('PackChanged', {
			group = group,
			callback = function(ev)
				local data = ev.data or {}
				local spec = data.spec or {}
				if spec.name == 'nvim-treesitter' and data.kind == 'update' then
					vim.schedule(function()
						vim.cmd('TSUpdate')
					end)
				end
			end,
		})
	end,
	setup = function()
		local parsers = {
			'c', -- builtin
			'lua', -- builtin
			'vim', -- builtin
			'vimdoc', -- builtin
			'query', -- builtin
			'bash',
			'regex',
			'css',
			'html',
			'templ',
			'javascript',
			'python',
			'make',
			'cmake',
			'cpp',
			'dockerfile',
			'go',
			'markdown',
			'markdown_inline',
			'sql',
			'hyprlang',
			'tsx',
			'json',
			'csv',
			'yaml',
		}

		require('nvim-treesitter').setup({})
		require('nvim-treesitter').install(parsers)

		local group = vim.api.nvim_create_augroup('TreeSitter', { clear = true })

		vim.api.nvim_create_autocmd('FileType', {
			group = group,
			pattern = '*',
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}

return plugin
