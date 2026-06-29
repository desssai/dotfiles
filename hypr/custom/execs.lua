hl.on("hyprland.start", function()
	-- Make the Hyprland session visible to DBus and user-systemd.
	-- This is needed for xdg-desktop-portal on minimal Hyprland sessions.

	-- Mark the graphical session as active for user services.
	hl.exec_cmd("systemctl --user start xdg-desktop-portal-kde.service")
	hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland.service")

	-- Your existing startup commands.
	hl.exec_cmd("~/.config/hypr/hyprland/scripts/disable-laptop-inactive.sh")
	hl.exec_cmd("vicinae server")
end)
