local opt = vim.opt -- store local variable for simplicity

-- line numbers
opt.relativenumber = true
opt.number = true

-- encoding
-- opt.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- scrolling
opt.scrolloff = 5
opt.sidescroll = 5

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cc = '80'

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows 
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
