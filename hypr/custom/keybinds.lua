require("hyprland.lib")
require("hyprland.variables")
if is_file_exists(HOME .. "/.config/hypr/custom/variables.lua") then
	require("custom.variables")
end

local qsIpcCall = "qs -c $qsConfig ipc call"
local mediaNextCmd = 'playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`'
local killAllCmd = "killall ags agsv1 gjs ydotool qs quickshell; qs -c $qsConfig &"

-- hl.bind(
-- 	"SUPER + P",
-- 	hl.dsp.exec_cmd("vicinae vicinae://extensions/vicinae/clipboard/history"),
-- 	{ description = "Clipboard history" }
-- )
-- hl.bind(
-- 	"SUPER + Period",
-- 	hl.dsp.exec_cmd("vicinae vicinae://extensions/vicinae/vicinae/search-emojis"),
-- 	{ description = "Emoji database" }
-- )
--
-- Vicinae 

hl.bind("SUPER + P", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"), {description = "Show current keymaps" })
hl.bind("SUPER + Period", hl.dsp.exec_cmd("vicinae vicinae://launch/@sovereign/store.vicinae.hypr-keybinds/hyprland-keybinds"), {description = "Show current keymaps" })

-- Keyboard Controls
hl.bind("CTRL + Space", hl.dsp.exec_cmd("hyprctl switchxkblayout current next"))

-- Dekstop Shell Bindings
hl.bind("SUPER + SHIFT + B",        hl.dsp.global("quickshell:barToggle"),               { description = "Toggle bar" })
hl.bind("SUPER + SHIFT + M",        hl.dsp.global("quickshell:mediaControlsToggle"),     { description = "Toggle media controls" })
hl.bind("SUPER + SHIFT + I",        hl.dsp.global("quickshell:sidebarLeftToggle"),       { description = "Toggle left sidebar" })
hl.bind("SUPER + SHIFT + O",        hl.dsp.global("quickshell:sidebarRightToggle"),      { description = "Toggle right sidebar" })
hl.bind("SUPER + SHIFT + K",        hl.dsp.global("quickshell:overlayToggle"),           { description = "Toggle overlay" })
hl.bind("SUPER + SHIFT + W",        hl.dsp.global("quickshell:wallpaperSelectorToggle"), { description = "Wallpaper selector" })
hl.bind("SUPER + SHIFT + CTRL + P", hl.dsp.global("quickshell:panelFamilyCycle"),        { description = "Cycle panel family" })
hl.bind("SUPER + SHIFT + R",        hl.dsp.exec_cmd(killAllCmd),                         { description = "Restart widgets" })
hl.bind("SUPER + SHIFT + Z",        hl.dsp.global("quickshell:sessionToggle"),           { description = "Toggle session menu" })
hl.bind("SUPER + Escape",           hl.dsp.exec_cmd("pkill -f settings.qml || qs -p ~/.config/quickshell/$qsConfig/settings.qml"), { description = "Settings app" })
-- hl.bind("SUPER + Slash", hl.dsp.global("quickshell:cheatsheetToggle"), { description = "Toggle cheatsheet" })

-- Media Controls
hl.bind("SUPER + SHIFT + N",     hl.dsp.exec_cmd(mediaNextCmd),                   { description = "Next media",           locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd(mediaNextCmd),                   {                                       locked = true })
hl.bind("SUPER + SHIFT + P",     hl.dsp.exec_cmd("playerctl previous"),           { description = "Previous media",       locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),           {                                       locked = true })
hl.bind("SUPER + SHIFT + Space", hl.dsp.exec_cmd("playerctl play-pause"),         { description = "Toggle media",         locked = true})
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"),         {                                       locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl play-pause"),         {                                       locked = true })

-- Sink & Source Controls
hl.bind("SUPER + CTRL + M",          hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"),              { description = "Mute active sink",   locked = true })
hl.bind("XF86AudioMute",             hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"),              {                                     locked = true })
hl.bind("SUPER + CTRL + SHIFT + M",  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"),            { description = "Mute active source", locked = true })
hl.bind("XF86AudioMicMute",          hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"),            {                                     locked = true })
hl.bind("XF86AudioRaiseVolume",      hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.5"),  {                                     locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",      hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),         {                                     locked = true, repeating = true })

-- Brightness Controls
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(qsIpcCall .. "brightness increment || brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(qsIpcCall .. "brightness decrement || brightnessctl s 5%-"), { locked = true, repeating = true })

-- Workspace & Window Navigation
local workspaceRelativeToWindow = function(workspace)
	local monitor = hl.get_active_monitor()
	if monitor ~= nil then
		return monitor.id * 10 + workspace
	end
	return workspace
end

for i = 1, 9 do
	hl.bind("CTRL + " .. i, function()
		hl.dispatch(hl.dsp.focus({ workspace = workspaceRelativeToWindow(i) }))
	end)
	hl.bind("SUPER + CTRL + " .. i, function()
		hl.dispatch(hl.dsp.window.move({ workspace = workspaceRelativeToWindow(i), follow = false }))
	end)
end

hl.bind("CTRL + h",          hl.dsp.focus({ workspace = "e-1" },     { description = "Previous workspace" }))
hl.bind("CTRL + l",          hl.dsp.focus({ workspace = "e+1" },     { description = "Next workspace" }))

hl.bind("SUPER + CTRL + h",  hl.dsp.window.move({ workspace = "-1",  follow = false }),  { description = "Send to previous workspace" })
hl.bind("SUPER + CTRL + l",  hl.dsp.window.move({ workspace = "+1",  follow = false }),  { description = "Send to next workspace" })

hl.bind("SUPER + h",          hl.dsp.focus({ direction = "l" }),  { description = "Focus window left" })
hl.bind("SUPER + k",          hl.dsp.focus({ direction = "u" }),  { description = "Focus window up" })
hl.bind("SUPER + j",          hl.dsp.focus({ direction = "d" }),  { description = "Focus window down" })
hl.bind("SUPER + l",          hl.dsp.focus({ direction = "r" }),  { description = "Focus window right" })

hl.bind("SUPER + SHIFT + h",  hl.dsp.window.swap({ direction = "l" }), { description = "Switch window left" })
hl.bind("SUPER + SHIFT + k",  hl.dsp.window.swap({ direction = "u" }), { description = "Switch window up" })
hl.bind("SUPER + SHIFT + j",  hl.dsp.window.swap({ direction = "d" }), { description = "Switch window down" })
hl.bind("SUPER + SHIFT + l",  hl.dsp.window.swap({ direction = "r" }), { description = "Switch window right" })

hl.bind("CTRL + Apostrophe",          hl.dsp.workspace.toggle_special("magick"),                             { description = "Toggle scratchpad" })
hl.bind("SUPER + CTRL + Apostrophe",  hl.dsp.window.move({ workspace = "special:magick", follow = false }),  { description = "Send to scratchpad" })

-- Window Commands
hl.bind("SUPER + CTRL + F",          hl.dsp.window.float(),                                                                { description = "Toggle floating" })
hl.bind("SUPER + CTRL + P",          hl.dsp.window.pseudo(),                                                               { description = "Toggle pseudo" })
hl.bind("SUPER + CTRL + D",          hl.dsp.window.pin(),                                                                  { description = "Pin window" })
hl.bind("SUPER + F",                 hl.dsp.window.fullscreen({ mode = "maximized",  action = "toggle" }),                 { description = "Maximise" })
hl.bind("SUPER + SHIFT + F",         hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),                 { description = "Fullscreen" })
hl.bind("SUPER + Q",                 hl.dsp.window.close(),                                                                { description = "Close the application" })
hl.bind("SUPER + SHIFT + Q",         hl.dsp.exec_cmd("hyprctl kill"),                                                      { description = "Kill the application" })
hl.bind("SUPER + CTRL + Backslash",  hl.dsp.window.resize({ x = 1200, y = 800, "exact" }),                                 { description = "Resize window to 1200x800"})
hl.bind("ALT + F4",                  hl.dsp.window.close())

-- Window Resising
hl.bind("SUPER + mouse:272",  hl.dsp.window.drag(),                                    { description = "Move",    mouse = true })
hl.bind("SUPER + mouse:273",  hl.dsp.window.resize(),                                  { description = "Resize",  mouse = true })
hl.bind("SUPER + Right",      hl.dsp.exec_cmd("hyprctl dispatch resizeactive 10 0"),   {                          repeating = true })
hl.bind("SUPER + Left",       hl.dsp.exec_cmd("hyprctl dispatch resizeactive -10 0"),  {                          repeating = true })
hl.bind("SUPER + Up",         hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -10"),  {                          repeating = true })
hl.bind("SUPER + Down",       hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 10"),   {                          repeating = true })

-- Screenshots & Screen Reconrding
hl.bind("SUPER + SHIFT + 1",  hl.dsp.global("quickshell:regionSearch"),      { description = "Search region" })
hl.bind("SUPER + SHIFT + 2",  hl.dsp.global("quickshell:regionOcr"),         { description = "OCR" })
hl.bind("SUPER + SHIFT + 3",  hl.dsp.global("quickshell:regionScreenshot"),  { description = "Screen region" })
hl.bind("SUPER + SHIFT + 4",  hl.dsp.global("quickshell:regionRecord"),      { description = "Record region (no sound)",  locked = true })
hl.bind("Print",              hl.dsp.exec_cmd("grim - | wl-copy"),           { description = "Screenshot",                locked = true })
-- hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("~/.config/quickshell/$qsConfig/scripts/videos/record.sh --fullscreen"), { locked = true }) -- # [hidden]
-- hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("~/.config/quickshell/$qsConfig/scripts/videos/record.sh --fullscreen --sound"), { locked = true, description = "Record screen (with sound)" })
-- hl.bind("SUPER + SHIFT + ALT + mouse:273", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/ai/primary-buffer-query.sh"), { description = "Generate AI summary for selected text" }) -- # [hidden]

hl.bind("SUPER + Return", hl.dsp.exec_cmd("ghostty"), { description = "Terminal" })
hl.bind("SUPER + Space", hl.dsp.exec_cmd("vicinae toggle"), { description = "App menu" })
hl.bind("SUPER + W", hl.dsp.exec_cmd("zen-browser"), { description = "Browser" })
hl.bind("SUPER + E", hl.dsp.exec_cmd("pkill -x dolphin || dolphin"), { description = "File manager" })
hl.bind("SUPER + T", hl.dsp.exec_cmd("pkill -x btop || ghostty -e fish -lic btop"), { description = "Task manager" })
hl.bind("SUPER + C", hl.dsp.exec_cmd("pkill -x hyprpicker || hyprpicker -a"), { description = "Color picker" })
hl.bind("SUPER + V", hl.dsp.exec_cmd("pkill -x pavucontrol-qt || pavucontrol-qt"), { description = "Volume mixer" })

-- Session & Shutdown
hl.bind("SUPER + SHIFT + Q",                    hl.dsp.exec_cmd("loginctl lock-session"),                    { description = "Lock" })
hl.bind("SUPER + SHIFT + CTRL + Q",             hl.dsp.exec_cmd("systemctl suspend || loginctl suspend"),    { description = "Suspend system",  locked = true })
hl.bind("CTRL + SHIFT + ALT + SUPER + Delete",  hl.dsp.exec_cmd("systemctl poweroff || loginctl poweroff"),  { description = "Shutdown" })

-- hl.bind("ALT + u", hl.dsp.exec_cmd('hyprctl dispatch sendshortcut "ALT, u, activewindow"'), { repeating = true }) -- # [hidden]
-- hl.bind("ALT + w", hl.dsp.exec_cmd('hyprctl dispatch sendshortcut "ALT, w, activewindow"'), { repeating = true }) -- # [hidden]
-- hl.bind("ALT + n", hl.dsp.exec_cmd('hyprctl dispatch sendshortcut "ALT, n, activewindow"'), { repeating = true }) -- # [hidden]
-- hl.bind("ALT + h", hl.dsp.exec_cmd('hyprctl dispatch sendshortcut "ALT, h, activewindow"'), { repeating = true }) -- # [hidden]
-- hl.bind(
-- 	"ALT + j",
-- 	hl.dsp.exec_cmd(
-- 		'hyprctl activewindow | grep -q "class: zen" && hyprctl dispatch sendshortcut "CTRL, page_down, activewindow" || hyprctl dispatch sendshortcut "ALT, j, activewindow"'
-- 	),
-- 	{ repeating = true }
-- ) -- # [hidden]
-- hl.bind("ALT + k", hl.dsp.exec_cmd("hyprctl activewindow | grep -q "class: zen" && hyprctl dispatch sendshortcut "CTRL, page_up, activewindow" || hyprctl dispatch sendshortcut "ALT, k, activewindow""), { repeating = true }) -- # [hidden]
-- hl.bind("ALT + l", hl.dsp.exec_cmd("hyprctl dispatch sendshortcut "ALT, l, activewindow""), { repeating = true }) -- # [hidden]
--
--
-- hl.bind("CTRL + j", hl.dsp.exec_cmd("hyprctl activewindow | grep -q "class: obsidian" && hyprctl dispatch sendshortcut ", down, activewindow" || hyprctl dispatch sendshortcut "CTRL, j, activewindow""), { repeating = true }) -- # [hidden]
-- hl.bind("CTRL + k", hl.dsp.exec_cmd("hyprctl activewindow | grep -q "class: obsidian" && hyprctl dispatch sendshortcut ", up, activewindow" || hyprctl dispatch sendshortcut "CTRL, k, activewindow""), { repeating = true }) -- # [hidden]

-- Disable Keybinds For Some Reason
hl.define_submap("virtual-machine", function()
	hl.bind("SUPER + ALT + F1", function()
		local currentsubmap = hl.get_current_submap()
		if currentsubmap == "virtual-machine" then
			hl.dispatch(
				hl.dsp.exec_cmd("notify-send 'Exited Virtual Machine submap' 'Keybinds re-enabled' -a 'Hyprland'")
			)
			hl.dispatch(hl.dsp.submap("reset"))
		elseif currentsubmap == "" then
			hl.dispatch(
				hl.dsp.exec_cmd(
					"notify-send 'Entered Virtual Machine submap' 'Keybinds disabled. Hit Super+Alt+F1 to escape' -a 'Hyprland'"
				)
			)
			hl.dispatch(hl.dsp.submap("virtual-machine"))
		end
	end, { submap_universal = true, description = "Disable keybinds" })
end)
