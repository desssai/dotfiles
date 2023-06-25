local status, cmp = pcall(require, "cmp")
if not status then
	print("NVIM-CMP NOT FOUND!")
	return
end

local status, luasnip = pcall(require, "luasnip")
if not status then
	print("NVIM-LUASNIP NOT FOUND!")
	return
end

local status, lspkind = pcall(require, "lspkind")
if not status then
	print("LSPKIND NOT FOUND!")
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	
	-- sources for autocompletion	
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- LSP Autocompletions
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
		{ name = "cmdline" }, -- Command Line Autocompletions
	}),
	
	-- LSPKIND for VS-Code-like icons
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
      		maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      		ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    	}),
	},
})
