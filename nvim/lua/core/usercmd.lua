vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
	desc = "Show LSP Info",
})

vim.api.nvim_create_user_command("LspLog", function()
	local state_path = vim.fn.stdpath("state")
	local log_path = vim.fs.joinpath(state_path, "lsp.log")

	vim.cmd(string.format("edit %s", log_path))
end, {
	desc = "Show LSP log",
})

vim.api.nvim_create_user_command("LspRestart", "lsp restart", {
	desc = "Restart LSP",
})

vim.api.nvim_create_user_command("Pack", function()
	vim.pack.update(nil, { offline = true })
end, { nargs = "*", bang = true, force = true })

vim.api.nvim_create_user_command("PackSync", function()
	vim.pack.update(nil, { target = "lockfile" })
end, { desc = "Sync plugin versions with lockfile" })

vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, { desc = "Update plugins to the latest version" })
