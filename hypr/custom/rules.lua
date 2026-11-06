-- # You can put custom rules here
-- # Window/layer rules: https://wiki.hyprland.org/Configuring/Window-Rules/
-- # Workspace rules: https://wiki.hyprland.org/Configuring/Workspace-Rules/
--
-- # ######## Window rules ########
--
-- # Uncomment to apply global transparency to all windows:
-- # windowrule = opacity 0.89 override 0.89 override, match:class .*
-- # windowrule = match:class kitty, no_blur off
--
-- # Disable blur for all xwayland apps
-- # windowrule = no_blur on, match:xwayland 1
-- windowrule = match:fullscreen true, decorate off
-- windowrule = match:initial_class obsidian, pseudo on, size 3440 1440
-- windowrule = match:initial_title Media viewer, float on
-- windowrule = match:class spotify, float on, size 1800 1260
--
hl.window_rule({ match = { initial_class = "com.mitchellh.ghostty" }, no_blur = false, size = { 3560, 1440 } })
hl.window_rule({ match = { initial_class = "org-tlauncher-tlauncher-rmo-TLauncher" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ name = "minecraft-letterbox",
	match = { initial_class = "Minecraft\\* 1%.20%.1" }, size = { 3440, 1440 },
	move = { "(monitor_w-window_w)/2", "(monitor_h-window_h)/2" }, no_shadow = true, no_blur = true,
})
hl.window_rule({ match = { initial_class = "kdesystemsettings" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ match = { initial_class = "pavucontrol-qt" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ match = { initial_class = "org.kde.dolphin" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ match = { initial_class = "org.telegram.desktop" }, size = { 3560, 1440 }, pseudo = true })
hl.window_rule({ match = { initial_class = "zen" }, size = { 3560, 1440 }, pseudo = true })
hl.window_rule({ match = { initial_class = "obsidian" }, size = { 3560, 1440 }, pseudo = true })
hl.window_rule({ match = { initial_title = "btop" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ match = { initial_title = "REAPER" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ match = { initial_title = "figma-linux" }, size = { 3440, 1440 }, pseudo = true })

hl.layer_rule({ match = { namespace = "vicinae" }, name = "vicinae", blur = true, no_anim = true, ignore_alpha = 0 })
