WinBar = {
	path = function()
		return vim.api.nvim_buf_get_name(0)
	end,
	git = function()
		local git_info = vim.b.gitsigns_status_dict
		if not git_info or git_info.head == '' then
			return ''
		end

		local head = git_info.head
		local added = git_info.added and (' +' .. git_info.added) or ''
		local changed = git_info.changed and (' ~' .. git_info.changed) or ''
		local removed = git_info.removed and (' -' .. git_info.removed) or ''
		if git_info.added == 0 then
			added = ''
		end
		if git_info.changed == 0 then
			changed = ''
		end
		if git_info.removed == 0 then
			removed = ''
		end

		return table.concat({
			'[  ', -- branch icon
			head,
			added,
			changed,
			removed,
			' ]',
		})
	end,
}

-- local winbar = function()
-- 	return table.concat {
-- 		"[%n] [ %f ] %{%v:lua.WinBar.path()%}",
-- 		"%=",
-- 		"%{%v:lua.WinBar.git()%} %m",
-- 	}
-- end

local active = function()
	return table.concat({
		'[%n] [ %f ]',
		'%=',
		'[ %p%% ] %y [ %l:%c ]',
	})
end

local inactive = function()
	return table.concat({
		'[%n] [ %f ]',
	})
end

local group = vim.api.nvim_create_augroup('WinBar', { clear = true })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
	group = group,
	desc = 'Activate statusline on focus',
	callback = function()
		vim.opt_local.statusline = active()
		-- vim.opt.winbar = winbar()
	end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
	group = group,
	desc = 'Deactivate statusline when unfocused',
	callback = function()
		vim.opt_local.statusline = inactive()
	end,
})

vim.api.nvim_create_autocmd('User', {
	pattern = 'GitSignsUpdate',
	group = group,
	desc = 'Redraw statusline on gitsign change',
	callback = function()
		vim.cmd('redrawstatus')
	end,
})
