local opt = vim.opt
local g = vim.g

-- Global statusline
opt.laststatus = 0

-- Options for nvim behaviour
opt.clipboard = "unnamedplus"
opt.backspace = "indent,eol,start"
opt.iskeyword:append("-")

-- Indenting
opt.expandtab = false
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true

-- Autocompletions
opt.autocomplete = true
opt.pumborder = "none"
opt.pummaxwidth = 40
opt.completeopt = "menuone,noselect,popup"

-- Search
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true

-- Mouse behaviour
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- Disable nvim intro
opt.shortmess:append("sI")

-- Additional info column for plugins
opt.signcolumn = "yes:1"

-- Window split behaviour
opt.splitbelow = true
opt.splitright = true

-- UI options
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = "80"
opt.listchars = "tab:│ ,multispace:·,lead:·,trail:·,nbsp:+"
opt.list = true
opt.guicursor = "i:block"
opt.scrolloff = 8

-- Timeout for a mapping execution
opt.timeoutlen = 400

-- Save undo history to a file
opt.undofile = true

-- Interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- Go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

g.mapleader = " "

-- Disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	g["loaded_" .. provider .. "_provider"] = 0
end

-- Add binaries instaled by Mason for LSP functionality
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH

-- Enable filetype detection, plugins, and indentation
vim.cmd.filetype("plugin indent on")

-- cmd([[match TrailingWhitespace /\s\+$/]])

-- nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

-- nvim_create_autocmd("InsertEnter", {
-- 	callback = function()
-- 		opt.listchars.trail = nil
-- 		nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
-- 	end
-- })

-- nvim_create_autocmd("InsertLeave", {
-- 	callback = function()
-- 		opt.listchars.trail = space
-- 		nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
-- 	end
-- })
