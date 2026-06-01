hl.on("hyprland.start", function()
	hl.exec_cmd("~/.config/hypr/hyprland/scripts/disable-laptop-inactive.sh")
	hl.exec_cmd("vicinae server")
end)
