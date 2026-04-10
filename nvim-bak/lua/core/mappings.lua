local M = {}

M.set = function(plugin, buffer)
	vim.schedule(function()
		local mappings = require(plugin)

		for mode, mode_values in pairs(mappings) do
			for keybind, mapping_info in pairs(mode_values) do
				local opts = mapping_info.opts or {}
				opts.desc = mapping_info[2]
				opts.buffer = buffer

				vim.keymap.set(mode, keybind, mapping_info[1], opts)
			end
		end
	end)
end

return M
