local plugin = {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {

		require("plugins.configs.l3m0n4d3_luasnip"),
		require("plugins.configs.onsails_lspkind-nvim"),
		require("plugins.configs.windwp_nvim-autopairs"),
		-- require("plugins.configs.luckasranarison_tailwind-tools"),

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
		-- local tailwind = require("tailwind-tools.cmp")
		local lspkind = require("lspkind")
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
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
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					-- can also be a function to dynamically calculate max width such as
					-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					-- before = tailwind.lspkind_format,
				}),
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
