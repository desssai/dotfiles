local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Package manager for neovim
	use 'wbthomason/packer.nvim'

	-- Personal colorsheme
	use 'folke/tokyonight.nvim'

	-- Window Maximizer
	use 'szw/vim-maximizer'

	-- Neovim Tree-File-Manager
	use 'nvim-tree/nvim-tree.lua'

	-- Neovim Tree Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Lualine plugin
	use 'nvim-lualine/lualine.nvim'

	-- Plenary Vim as a Dependency for other Packages
	use "nvim-lua/plenary.nvim"

	-- Fuzzy Finder for Neovim
	-- Make sure "ripgrep" is installed as a dependency
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
	use 'nvim-telescope/telescope-ui-select.nvim'

	-- Mason - Manager for LSP Servers
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- Autocompletion & LSP Servers
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'onsails/lspkind.nvim'
	use 'smjonas/inc-rename.nvim'

	-- Snippets for LSP
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	-- TreeSitter for personalization
	use { 'nvim-treesitter/nvim-treesitter',
		run = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	}

	-- Autopairs Completion
	use 'windwp/nvim-autopairs' -- autoclose parens, brackets, quotes, etc...
	use { 'windwp/nvim-ts-autotag', after = "nvim-treesitter" } -- autoclose tags

	-- Startup Theme for Neovim
	use 'startup-nvim/startup.nvim'

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	if packer_bootstrap then
		require('packer').sync()
	end
end)
