local plugins = {
	require('plugins.catppuccin'),
	require('plugins.which-key'),
	require('plugins.gitsigns'),
	require('plugins.blink'),
	require('plugins.mini-ai'),
	require('plugins.mini-icons'),
	require('plugins.mini-pairs'),
	require('plugins.mini-surround'),
	require('plugins.mini-bufremove'),
	require('plugins.conform'),
	require('plugins.tmux'),
	require('plugins.oil'),
	require('plugins.fzf-lua'),
	require('plugins.mason'),
	require('plugins.treesitter'),
	require('plugins.bufferline'),
	require('plugins.dadbod-ui'),
}

local loaded = {}

local function add_plugin_and_deps(plugin, specs, setups)
	if type(plugin) ~= 'table' or plugin.src == nil or loaded[plugin.src] then
		return
	end

	for _, dep in ipairs(plugin.deps or {}) do
		if type(dep) == 'string' then
			if not loaded[dep] then
				loaded[dep] = true
				table.insert(specs, { src = dep })
			end
		elseif type(dep) == 'table' then
			add_plugin_and_deps(dep, specs, setups)
		end
	end

	if type(plugin.src) == 'string' then
		table.insert(specs, { src = plugin.src })
	end

	if type(plugin.setup) == 'function' then
		table.insert(setups, plugin.setup)
	end

	loaded[plugin.src] = true
end

local function load(plugin)
	local specs = {}
	local setups = {}

	add_plugin_and_deps(plugin, specs, setups)

	vim.pack.add(specs)

	for _, setup in ipairs(setups) do
		setup()
	end
end

local function onCommandHook(plugin)
	if type(plugin.cmd) == 'table' and not vim.tbl_isempty(plugin.cmd) then
		for _, cmd in ipairs(plugin.cmd) do
			vim.api.nvim_create_user_command(cmd, function(opts)
				for _, c in ipairs(plugin.cmd) do
					vim.api.nvim_del_user_command(c)
				end

				load(plugin)

				vim.cmd({ cmd = cmd, args = opts.fargs, bang = opts.bang })
			end, { nargs = '*', bang = true, force = true })
		end
		return true
	end
	return false
end

local function onEventHook(plugin, group)
	if type(plugin.event) == 'table' and not vim.tbl_isempty(plugin.event) then
		vim.api.nvim_create_autocmd(plugin.event, {
			group = group,
			callback = function(args)
				vim.api.nvim_del_augroup_by_id(group)
				load(plugin)
			end,
		})
		return true
	end
	return false
end

local function onFiletypeHook(plugin, group)
	if type(plugin.ft) == 'table' and not vim.tbl_isempty(plugin.ft) then
		vim.api.nvim_create_autocmd('FileType', {
			group = group,
			pattern = plugin.ft,
			callback = function(args)
				vim.api.nvim_del_augroup_by_id(group)
				load(plugin)
			end,
		})
		return true
	end
	return false
end

local function setup()
	for idx, plugin in ipairs(plugins) do
		local group = vim.api.nvim_create_augroup('LazyLoad' .. idx, { clear = true })

		if type(plugin.init) == 'function' then
			plugin.init()
		end

		local isDeferred = onCommandHook(plugin)
			or onFiletypeHook(plugin, group)
			or onEventHook(plugin, group)
		if not isDeferred then
			if type(plugin.lazy) == 'boolean' and plugin.lazy == true then
				vim.api.nvim_create_autocmd('UIEnter', {
					callback = function(args)
						load(plugin)
					end,
				})
			else
				load(plugin)
			end
		end
	end

	vim.schedule(function()
		vim.cmd.packadd('nvim.undotree')
	end)
end

setup()
