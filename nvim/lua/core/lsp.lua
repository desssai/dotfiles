-- local diagnostic_icons = require("core.icons").diagnostics

--- Sets up LSP keymaps and autocommands for the given buffer.

-- Define the diagnostic signs.
-- for severity, icon in pairs(diagnostic_icons) do
--     local hl = 'DiagnosticSign' .. severity:sub(1, 1) .. severity:sub(2):lower()
--     vim.fn.sign_define(hl, { text = icon, texthl = hl })
-- end

-- Diagnostic configuration.
-- vim.diagnostic.config {
-- 	status = {
-- 		format = {
-- 			[vim.diagnostic.severity.ERROR] = diagnostic_icons.ERROR,
-- 			[vim.diagnostic.severity.WARN] = diagnostic_icons.WARN,
-- 			[vim.diagnostic.severity.INFO] = diagnostic_icons.INFO,
-- 			[vim.diagnostic.severity.HINT] = diagnostic_icons.HINT,
-- 		},
-- 	},
-- 	virtual_text = {
-- 		prefix = '',
-- 		spacing = 2,
-- 		format = function(diagnostic)
-- 			-- Use shorter, nicer names for some sources:
-- 			local special_sources = {
-- 				['Lua Diagnostics.'] = 'lua',
-- 				['Lua Syntax Check.'] = 'lua',
-- 			}
--
-- 			local message = diagnostic_icons[vim.diagnostic.severity[diagnostic.severity]]
-- 			if diagnostic.source then
-- 				message = string.format('%s %s', message, special_sources[diagnostic.source] or diagnostic.source)
-- 			end
-- 			if diagnostic.code then
-- 				message = string.format('%s[%s]', message, diagnostic.code)
-- 			end
--
-- 			return message .. ' '
-- 		end,
-- 	},
-- 	float = {
-- 		source = 'if_many',
-- 		-- Show severity icons as prefixes.
-- 		prefix = function(diag)
-- 			local level = vim.diagnostic.severity[diag.severity]
-- 			local prefix = string.format(' %s ', diagnostic_icons[level])
-- 			return prefix, 'Diagnostic' .. level:gsub('^%l', string.upper)
-- 		end,
-- 	},
-- 	-- Disable signs in the gutter.
-- 	signs = false,
-- }

-- Override the virtual text diagnostic handler so that the most severe diagnostic is shown first.
-- local show_handler = assert(vim.diagnostic.handlers.virtual_text.show)
-- local hide_handler = vim.diagnostic.handlers.virtual_text.hide
-- vim.diagnostic.handlers.virtual_text = {
-- 	show = function(ns, bufnr, diagnostics, opts)
-- 		table.sort(diagnostics, function(diag1, diag2)
-- 			return diag1.severity > diag2.severity
-- 		end)
-- 		return show_handler(ns, bufnr, diagnostics, opts)
-- 	end,
-- 	hide = hide_handler,
-- }

local function on_attach(_, bufnr)
	require("core.mappings").set("mappings.lsp", bufnr)
end

-- Update mappings when registering dynamic capabilities.
vim.lsp.handlers['client/registerCapability'] = (function(overridden)
	return function(err, res, ctx)
		local result = overridden(err, res, ctx)
		local client = vim.lsp.get_client_by_id(ctx.client_id)
		if not client then
			return
		end
		for bufnr, _ in pairs(client.attached_buffers) do
			on_attach(client, bufnr)
		end
		return result
	end
end)(vim.lsp.handlers['client/registerCapability'])

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'Configure LSP keymaps',
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		on_attach(client, ev.buf)
	end,
})

vim.api.nvim_create_autocmd('LspDetach', {
	callback = function(ev)
		-- Get the detaching client
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		-- Remove the autocommand to format the buffer on save, if it exists
		if client:supports_method('textDocument/formatting') then
			vim.api.nvim_clear_autocmds({
				event = 'BufWritePre',
				buffer = ev.buf,
			})
		end
	end,
})

-- Set up LSP servers.
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
	once = true,
	callback = function()
		-- Extend neovim's client capabilities with the completion ones.
		vim.lsp.config('*', {
			capabilities = vim.tbl_deep_extend("force",
				vim.lsp.protocol.make_client_capabilities(),
				require("blink.cmp").get_lsp_capabilities()
			)
		})

		local servers = vim.iter(vim.api.nvim_get_runtime_file('lsp/*.lua', true))
				:map(function(file)
					return vim.fn.fnamemodify(file, ':t:r')
				end)
				:totable()
		vim.lsp.enable(servers)
	end,
})
