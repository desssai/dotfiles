local status, startup = pcall(require, 'startup')
if not status then
	print('STARTUP NOT FOUND!')
	return
end

startup.setup({theme = 'evil' })
