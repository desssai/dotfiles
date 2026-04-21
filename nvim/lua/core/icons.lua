local M = {}

--- Diagnostic severities.
M.diagnostics = {
	ERROR = '',
	WARN = '',
	HINT = '',
	INFO = '',
}

--- For folding.
M.arrows = {
	right = '',
	left = '',
	up = '',
	down = '',
}

M.lsp_kind = {
	Array = '󰅪',
	Class = '󰠱',
	Color = '󰏘',
	Constant = '󰏿',
	Constructor = '',
	Enum = '',
	EnumMember = '',
	Event = '',
	Field = '󰜢',
	File = '󰈙',
	Folder = '󰉋',
	Function = '󰊕',
	Interface = '',
	Keyword = '󰌋',
	Method = '󰆧',
	Module = '',
	Operator = '󰆕',
	Property = '󰜢',
	Reference = '󰈇',
	Snippet = '',
	Struct = '󰙅',
	Text = '󰉿',
	TypeParameter = '',
	Unit = '󰑭',
	Value = '󰎠',
	Variable = '󰀫',
}

M.gitsigns = {
	add = { text = '┃' },
	change = { text = '┃' },
	delete = { text = '󰍵' },
	topdelete = { text = '‾' },
	changedelete = { text = '~' },
	untracked = { text = '┇' },
}

--- Shared icons that don't really fit into a category.
M.misc = {
	bug = '',
	dashed_bar = '┊',
	dashed_bar_bold = '┇',
	vertical_bar = '│',
	vertical_bar_bold = '┃',
	ellipsis = '…',
	git = '',
	palette = '󰏘',
	robot = '󰚩',
	search = '',
	terminal = '',
	toolbox = '󰦬',
	deleted = '󰍵',
	border_solid = '█',
	border_round = '',
	package_pending = ' ',
	package_installed = ' ',
	package_uninstalled = ' ',
}

return M
