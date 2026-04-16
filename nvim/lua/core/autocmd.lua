-- local group = vim.api.nvim_create_augroup("Help", { clear = true })

-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	group = group,
-- 	callback = function(a)
-- 		if vim.bo[a.buf].filetype == "help" then
-- 			vim.cmd("wincmd K")          -- pick a width you like
-- 			vim.cmd("horizontal resize") -- pick a width you like
-- 		end
-- 	end,
-- })


-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function() vim.hl.on_yank() end,
})
