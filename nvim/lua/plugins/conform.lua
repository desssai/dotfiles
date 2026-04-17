local plugin = {
	name = "conform",
	url = "https://github.com/stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	init = function(self)
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require(self.name).format({ bufnr = args.buf })
			end,
		})
	end,
	opts = {
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			python = { "black" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			rust = { "rustfmt" },
			templ = { "templ" },
			go = { "golines", "goimport", "gofumpt" },
			sql = { "sqlfmt" },
			css = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
		},
		formatters = {
			["clang-format"] = {
				prepend_args = { "-style=file", "-fallback-style=LLVM" },
			},
		},
	},
	setup = function(self)
		vim.pack.add({ { name = self.name, src = self.url } }, nil)
		require(self.name).setup(self.opts)
	end,
}

return plugin
