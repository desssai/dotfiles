local plugin = {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {

		require("plugins.configs.l3m0n4d3_luasnip"),
		require("plugins.configs.windwp_nvim-autopairs"),

		-- cmp sources plugins
		{
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},

	config = function()
		-- local function border(hl_name)
		-- 	return {
		-- 		{ "┌", hl_name },
		-- 		{ "─", hl_name },
		-- 		{ "┐", hl_name },
		-- 		{ "│", hl_name },
		-- 		{ "┘", hl_name },
		-- 		{ "─", hl_name },
		-- 		{ "└", hl_name },
		-- 		{ "│", hl_name },
		-- 	}
		-- end

		local cmp_kinds = {
			Text = "  ",
			Method = "  ",
			Function = "  ",
			Constructor = "  ",
			Field = "  ",
			Variable = "  ",
			Class = "  ",
			Interface = "  ",
			Module = "  ",
			Property = "  ",
			Unit = "  ",
			Value = "  ",
			Enum = "  ",
			Keyword = "  ",
			Snippet = "  ",
			Color = "  ",
			File = "  ",
			Reference = "  ",
			Folder = "  ",
			EnumMember = "  ",
			Constant = "  ",
			Struct = "  ",
			Event = "  ",
			Operator = "  ",
			TypeParameter = "  ",
		}

		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			},
			view = {
				entries = {
					name = "custom",
					selection_order = "near_cursor",
				},
			},
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			window = {
				completion = {
					side_padding = 1,
					scrollbar = false,
					scrolloff = 1,
					border = nil,
					winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder",
				},
				documentation = {
					border = nil,
					winhighlight = "Normal:Pmenu",
				},
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, item)
					item.kind = (cmp_kinds[item.kind] or "") .. item.kind
					item.menu = ({
						path = "Path",
						nvim_lsp = "Lsp",
						nvim_lua = "Lua",
						buffer = "Buffer",
						cmdline = "Command",
						luasnip = "Snippet",
					})[entry.source.name]

					local len = string.len(item.abbr .. item.kind .. item.menu)

					if len > 58 then
						item.abbr = item.abbr:sub(58 - string.len(item.kind .. item.menu))
					elseif len < 58 then
						item.abbr = item.abbr .. string.rep(" ", 58 - len, "")
					end

					return item
				end,
			},
			mapping = require("mappings.hrsh7th_nvim-cmp"),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = require("mappings.hrsh7th_nvim-cmp"),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = require("mappings.hrsh7th_nvim-cmp"),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
return plugin
