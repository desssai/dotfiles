vim.api.nvim_create_user_command("BufDelete", function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_call_function('bprevious', {})
end, { nargs = "*", bang = true, force = true })
