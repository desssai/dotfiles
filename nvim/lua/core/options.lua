local opt = vim.opt
local g = vim.g

-- Global statusline
opt.laststatus = 3
opt.showmode = false

-- Options for nvim behaviour
opt.clipboard = "unnamedplus"
opt.backspace = "indent,eol,start"
opt.iskeyword:append("-")

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

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
opt.signcolumn = "yes"

-- Window split behaviour
opt.splitbelow = true
opt.splitright = true

-- UI options
opt.termguicolors = true
opt.cursorline = false
opt.colorcolumn = ""

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
