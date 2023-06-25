local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	print('GITSIGNS NOT FOUND!')
	return
end

-- configure/enable gitsigns
gitsigns.setup()
