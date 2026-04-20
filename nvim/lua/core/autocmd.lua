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
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- vim.cmd([[match TrailingWhitespace /\s\+$/]])
-- vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
--
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	callback = function()
-- 		opt.listchars.trail = nil
-- 		vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
-- 	end
-- })
--
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	callback = function()
-- 		opt.listchars.trail = "·"
-- 		vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
-- 	end
-- })

-- Make the cmdline appear at the center of screen
-- But still keep the notifications where they belong
-- And make sure that completions window appears with the cmdline
-- vim.api.nvim_create_autocmd('FileType', {
-- 	pattern = 'cmd',
-- 	callback = function()
-- 		local ui2 = require('vim._core.ui2')
-- 		vim.schedule(function()
-- 			local win = ui2.wins and ui2.wins.cmd
-- 			if win and vim.api.nvim_win_is_valid(win) then
-- 				local win_config = vim.api.nvim_win_get_config(win)
-- 				local width = math.floor(vim.o.columns * 0.6)
-- 				local height = win_config.height or 1
-- 				local row = (vim.o.lines - height) / 2
-- 				local col = (vim.o.columns - width) / 2
-- 				pcall(vim.api.nvim_win_set_config, win, {
-- 					relative = 'editor',
-- 					row = row,
-- 					col = col,
-- 					width = width,
-- 					height = height,
-- 					anchor = 'NW',
-- 					border = 'solid',
-- 					style = 'minimal',
-- 				})
-- 			end
-- 		end)
-- 	end,
-- })
