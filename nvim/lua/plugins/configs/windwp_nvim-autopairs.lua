local plugin = {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}

return plugin
