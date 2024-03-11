local cmp = require("cmp")

local mappings = {
	["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
	["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-q>"] = cmp.mapping.close(),
	["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
}

return mappings
