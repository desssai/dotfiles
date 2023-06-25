vim.g.mapleader = " "

local keymap = vim.keymap

-- leave insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlightr
keymap.set("n", "<leader>nh", ":mohl<CR>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- window management
keymap.set("n", "<leader>i", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>v", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>b", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>w", ":close<CR>") -- close current split window

keymap.set("n", "<leader>tn", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tw", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tl", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>th", ":tabp<CR>") --  go to previous tab

-- navigation between windows
keymap.set("n", "<tab>", "<C-w>")
keymap.set("n", "<tab><tab>", "<C-w><C-w>")
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>l", "<C-w>l")

-- NeoVim Tree Toggle
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- window maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")

-- Telescope Keymaps for Fuzzy Finder
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
