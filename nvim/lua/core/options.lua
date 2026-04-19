local opt = vim.opt

-- Global statusline
opt.laststatus = 3

-- Options for nvim behaviour
opt.clipboard = 'unnamedplus'
opt.backspace = 'indent,eol,start'
opt.iskeyword:append('-')

-- Indenting
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = false
opt.softtabstop = 0

-- Autocompletions & Popup / Float windows
opt.pumborder = 'solid'
opt.winborder = 'solid'
opt.pummaxwidth = 80
opt.completeopt = 'menu,menuone,noselect,popup'

-- Search
opt.fillchars = { eob = ' ' }
opt.ignorecase = true
opt.smartcase = true

-- Mouse behaviour
opt.mouse = 'a'

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- Disable nvim intro
opt.shortmess:append('sI')

-- Additional info column for plugins
opt.signcolumn = 'yes:1'

-- Window split behaviour
opt.splitbelow = true
opt.splitright = true
opt.inccommand = 'split'

-- UI options
opt.termguicolors = true
opt.cursorline = true
opt.cursorlineopt = 'screenline,number'
opt.colorcolumn = '100'
opt.list = true
opt.scrolloff = 8
opt.cmdheight = 0
opt.showmode = false
opt.listchars = {
	tab = '│ ',
	multispace = '·',
	trail = '·',
	lead = '·',
	nbsp = '+',
}

-- Timeout for a mapping execution
opt.timeoutlen = 500

-- Save undo history to a file
opt.undofile = true

-- Interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- Go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append('<>[]hl')

-- vim.cmd([[match TrailingWhitespace /\s\+$/]])
--
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
