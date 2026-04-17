return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = {
		{ '.luarc.json', '.luarc.jsonc' },
		{ '.luacheckrc', '.stylua.toml', 'stylua.toml' },
		{ '.git' },
	},
	settings = {
		Lua = {
			completion = { callSnippet = 'Replace' },
			codeLens = { enable = true },
			hint = {
				enable = true,
				arrayIndex = 'Disable',
			},
		},
	},
	on_init = function(client)
		if not client.workspace_folders then
			return
		end

		local path = client.workspace_folders[1].name
		if path ~= vim.fn.stdpath('config')
				and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
		then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua or {}, {
			runtime = {
				version = 'LuaJIT',
				path = {
					'lua/?.lua',
					'lua/?/init.lua',
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					'${3rd}/luv/library',
				},
			},
		})

		client:notify('workspace/didChangeConfiguration', {
			settings = client.config.settings,
		})
	end,
}
