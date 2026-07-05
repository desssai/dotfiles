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
hl.window_rule({ match = { initial_class = "pavucontrol-qt" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ match = { initial_class = "org.kde.dolphin" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ match = { initial_class = "org.telegram.desktop" }, size = { 3560, 1440 }, pseudo = true })
hl.window_rule({ match = { initial_class = "zen" }, size = { 3560, 1440 }, pseudo = true })
hl.window_rule({ match = { initial_class = "obsidian" }, size = { 3560, 1440 }, pseudo = true })
hl.window_rule({ match = { class = "ghostty" }, size = { 3440, 1440 } })
hl.window_rule({ match = { initial_title = "btop" }, float = true, size = { 1400, 1000 } })
hl.window_rule({ match = { initial_title = "figma-linux" }, size = { 3440, 1440 }, pseudo = true })

hl.layer_rule({ match = { namespace = "vicinae" }, name = "vicinae", blur = true, no_anim = true, ignore_alpha = 0 })

hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "6", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "7", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "8", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "9", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
hl.workspace_rule({ workspace = "7", monitor = "DP-1" })
hl.workspace_rule({ workspace = "8", monitor = "DP-1" })
hl.workspace_rule({ workspace = "9", monitor = "DP-1" })
hl.workspace_rule({ workspace = "10", monitor = "DP-1" })
hl.workspace_rule({ workspace = "11", monitor = "DP-3" })
hl.workspace_rule({ workspace = "12", monitor = "DP-3" })
hl.workspace_rule({ workspace = "13", monitor = "DP-3" })
hl.workspace_rule({ workspace = "14", monitor = "DP-3" })
hl.workspace_rule({ workspace = "15", monitor = "DP-3" })
hl.workspace_rule({ workspace = "16", monitor = "DP-3" })
hl.workspace_rule({ workspace = "17", monitor = "DP-3" })
hl.workspace_rule({ workspace = "18", monitor = "DP-3" })
hl.workspace_rule({ workspace = "19", monitor = "DP-3" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "11", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "12", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "13", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "14", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "15", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "16", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "17", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "18", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "19", monitor = "HDMI-A-1" })
