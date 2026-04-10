local M = {}

M.listen = function()
	vim.api.nvim_create_autocmd("Signal", {
		pattern = "SIGUSR1",
		callback = function()
			vim.cmd(":Lazy reload catpuccin")
			vim.cmd(":Lazy reload lualine.nvim")
		end,
	})
end

return M
