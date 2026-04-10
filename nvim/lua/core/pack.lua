local plugins = {
	require("plugins.catppuccin"),
	require("plugins.gitsigns"),
	require("plugins.tmux"),
	require("plugins.which-key"),
	require("plugins.oil"),
	require("plugins.fzf-lua"),
	require("plugins.mason"),
	require("plugins.lspconfig"),
	require("plugins.icons"),
}

vim.api.nvim_create_user_command("Pack", function()
	vim.pack.update(nil, { offline = true })
end, { nargs = "*", bang = true, force = true })

vim.api.nvim_create_user_command("PackSync", function()
	vim.pack.update(nil, { targer = "lockfile" })
end, { nargs = "*", bang = true, force = true })

local onCommandHook = function(plugin)
	local lazy = false
	for _, cmd in ipairs(plugin.cmd or {}) do
		lazy = true
		vim.api.nvim_create_user_command(cmd, function(opts)
			-- remove stub commands so real ones take over
			for _, c in ipairs(plugin.cmd) do
				vim.api.nvim_del_user_command(c)
			end

			plugin:setup()

			-- re-run the original command
			vim.cmd({ cmd = cmd, args = opts.fargs, bang = opts.bang })
		end, { nargs = "*", bang = true, force = true })
	end
	return lazy
end

local onFiletypeHook = function(plugin)
	if plugin.ft == nil and plugin.event == nil then
		return false
	end

	local group = vim.api.nvim_create_augroup("Load" .. plugin.name, { clear = true })

	vim.api.nvim_create_autocmd(plugin.event or { "BufReadPost", "BufNewFile" }, {
		group = group,
		callback = function(args)
			local buf = args.buf

			if vim.bo[buf].buftype ~= "" then
				return
			end

			if plugin.ft ~= nil then
				for _, filetype in ipairs(plugin.ft) do
					if vim.bo[buf].filetype == filetype then
						vim.api.nvim_del_augroup_by_id(group)
						plugin:setup()
						return
					end
				end
				return
			end
			vim.api.nvim_del_augroup_by_id(group)
			plugin:setup()
		end,
	})
	return true
end

local setup = function()
	-- Make sure the plugins are installed
	local list = {}
	for _, plugin in ipairs(plugins) do
		table.insert(list, {
			src = plugin.url,
			name = plugin.name,
			version = vim.version.range("*"),
		})
	end
	vim.pack.add(list, { force = true, load = function() end })

	-- Load the plugins on demand
	for _, plugin in ipairs(plugins) do
		if plugin.init then
			plugin:init()
		end
		if not onCommandHook(plugin) and not onFiletypeHook(plugin) then
			if plugin.lazy == nil or plugin.lazy == false then
				plugin:setup()
			else
				vim.schedule(function()
					plugin:setup()
				end)
			end
		end
	end
end

setup()
