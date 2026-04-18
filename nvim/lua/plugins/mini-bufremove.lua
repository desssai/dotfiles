local plugin = {
	src = 'https://github.com/nvim-mini/mini.bufremove',
	cmd = { 'BufDelete' },
	init = function()
		vim.api.nvim_create_user_command("BufDelete", function()
			require("mini.bufremove").delete()
		end, {})
		require('core.mappings').set('mappings.mini-bufremove')
	end,
	setup = function()
		vim.api.nvim_create_user_command("BufDelete", function()
			require("mini.bufremove").delete()
		end, {})
		require('mini.bufremove').setup()
	end,
}

return plugin
