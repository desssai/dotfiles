require("hyprland.lib")
require("hyprland.variables")
if is_file_exists(HOME .. "/.config/hypr/custom/variables.lua") then
	require("custom.variables")
end

local qsScripts = "$HOME/.config/quickshell/$qsConfig/scripts"
local hyprScripts = "$HOME/.config/hypr/hyprland/scripts"
local qsIpcCall = "qs -c $qsConfig ipc call"
local qsIsAlive = qsIpcCall .. " TEST_ALIVE"
local mediaNextCommand =
	'playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`'

hl.bind(
	"SUPER + P",
	hl.dsp.exec_cmd("vicinae vicinae://extensions/vicinae/clipboard/history"),
	{ description = "Clipboard history" }
)
hl.bind(
	"SUPER + Period",
	hl.dsp.exec_cmd("vicinae vicinae://extensions/vicinae/vicinae/search-emojis"),
	{ description = "Emoji database" }
)
hl.bind("SUPER + B", hl.dsp.global("quickshell:barToggle"), { description = "Toggle bar" })
hl.bind("SUPER + I", hl.dsp.global("quickshell:sidebarLeftToggle"), { description = "Toggle left sidebar" })
hl.bind("SUPER + N", hl.dsp.global("quickshell:sidebarRightToggle"), { description = "Toggle right sidebar" })
hl.bind("SUPER + K", hl.dsp.global("quickshell:overlayToggle"), { description = "Toggle overlay" })
hl.bind("SUPER + Slash", hl.dsp.global("quickshell:cheatsheetToggle"), { description = "Toggle cheatsheet" })
hl.bind("SUPER + CTRL + W", hl.dsp.global("quickshell:wallpaperSelectorToggle"), { description = "Wallpaper selector" })
hl.bind(
	"SUPER + CTRL + SHIFT + W",
	hl.dsp.global("quickshell:wallpaperSelectorRandom"),
	{ description = "Random wallpaper" }
)
hl.bind(
	"SUPER + CTRL + T",
	hl.dsp.exec_cmd(
		"qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/quickshell/$qsConfig/scripts/colors/switchwall.sh"
	)
) -- # [hidden]
hl.bind(
	"SUPER + CTRL + SHIFT + P",
	hl.dsp.global("quickshell:panelFamilyCycle"),
	{ description = "Cycle panel family" }
)
hl.bind(
	"SUPER + CTRL + R",
	hl.dsp.exec_cmd("killall ags agsv1 gjs ydotool qs quickshell; qs -c $qsConfig &"),
	{ description = "Restart widgets" }
)

hl.bind("CTRL + ALT + Delete", hl.dsp.global("quickshell:sessionToggle"), { description = "Toggle session menu" })
hl.bind(
	"CTRL + ALT + Delete",
	hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || pkill wlogout || wlogout -p layer-shell")
) -- # [hidden]

hl.bind("SUPER + M", hl.dsp.global("quickshell:mediaControlsToggle"), { description = "Toggle media controls" })
hl.bind(
	"SUPER + SHIFT + M",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"),
	{ locked = true, description = "Mute active sink" }
)
hl.bind(
	"SUPER + ALT + M",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"),
	{ locked = true, description = "Mute active source" }
)
hl.bind(
	"SUPER + SHIFT + N",
	hl.dsp.exec_cmd(
		'playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`'
	),
	{ locked = true, description = "Next item" }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("qs -c $qsConfig ipc call brightness increment || brightnessctl s 5%+"),
	{ locked = true, repeating = true }
) -- # [hidden]
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("qs -c $qsConfig ipc call brightness decrement || brightnessctl s 5%-"),
	{ locked = true, repeating = true }
) -- # [hidden]
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.5"),
	{ locked = true, repeating = true }
) -- # [hidden]
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ locked = true, repeating = true }
) -- # [hidden]
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true }) -- # [hidden]
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true }) -- # [hidden]
hl.bind("ALT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true }) -- # [hidden]
hl.bind(
	"XF86AudioNext",
	hl.dsp.exec_cmd(
		'playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`'
	),
	{ locked = true }
) -- # [hidden]
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true }) -- # [hidden]
hl.bind("SUPER + SHIFT + ALT + mouse:275", hl.dsp.exec_cmd("playerctl previous")) -- # [hidden]
hl.bind(
	"SUPER + SHIFT + ALT + mouse:276",
	hl.dsp.exec_cmd(
		'playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"`'
	)
) -- # [hidden]
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous track" })
hl.bind(
	"SUPER + SHIFT + P",
	hl.dsp.exec_cmd("playerctl play-pause"),
	{ locked = true, description = "Play/pause media" }
)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- # [hidden]
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true }) -- # [hidden]

hl.bind("CTRL + Space", hl.dsp.exec_cmd("hyprctl switchxkblayout current next"))
hl.bind("SUPER + Comma", hl.dsp.global("quickshell:oskToggle"), { description = "Toggle on-screen keyboard" })

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

hl.bind("CTRL + h", hl.dsp.focus({ workspace = "e-1" })) -- # [hidden]
hl.bind("CTRL + l", hl.dsp.focus({ workspace = "e+1" })) -- # [hidden]

hl.bind("SUPER + CTRL + h", hl.dsp.window.move({ workspace = "-1", follow = false })) -- # [hidden]
hl.bind("SUPER + CTRL + l", hl.dsp.window.move({ workspace = "+1", follow = false })) -- # [hidden]

hl.bind("SUPER + h", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "r" }))

hl.bind("SUPER + SHIFT + h", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.swap({ direction = "d" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.swap({ direction = "r" }))

hl.bind("SUPER + CTRL + F", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind("SUPER + CTRL + P", hl.dsp.window.pseudo(""), { description = "Toggle floating" })
hl.bind("SUPER + CTRL + D", hl.dsp.window.pin(), { description = "Pin window" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), { description = "Maximise" })
hl.bind(
	"SUPER + SHIFT + F",
	hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	{ description = "Fullscreen" }
)
hl.bind(
	"SUPER + SHIFT + CTRL + F",
	hl.dsp.window.fullscreen_state({ internal = 0, client = 3, action = "toggle" }),
	{ description = "Fullscreen spoof" }
)
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close" })
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprctl kill"), { description = "Kill" })
hl.bind("ALT + F4", hl.dsp.window.close()) -- # [hidden]

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move" })
hl.bind("SUPER + mouse:274", hl.dsp.window.drag(), { mouse = true }) -- # [hidden]
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize" })
hl.bind("SUPER + Right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 10 0"), { repeating = true }) -- # [hidden]
hl.bind("SUPER + Left", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -10 0"), { repeating = true }) -- # [hidden]
hl.bind("SUPER + Up", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -10"), { repeating = true }) -- # [hidden]
hl.bind("SUPER + Down", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 10"), { repeating = true }) -- # [hidden]

hl.bind(
	"SUPER + CTRL + Apostrophe",
	hl.dsp.window.move({ workspace = "special:special", follow = false }),
	{ description = "Send to scratchpad" }
)
hl.bind("SUPER + Apostrophe", hl.dsp.workspace.toggle_special("special"), { description = "Toggle scratchpad" })

hl.bind("SUPER + SHIFT + 3", hl.dsp.global("quickshell:regionScreenshot"), { description = "Screen snip" })
hl.bind(
	"SUPER + SHIFT + 3",
	hl.dsp.exec_cmd(
		"qs -c $qsConfig ipc call TEST_ALIVE || pidof slurp || hyprshot --freeze --clipboard-only --mode region --silent"
	)
) -- # [hidden]
hl.bind("SUPER + SHIFT + 2", hl.dsp.global("quickshell:regionSearch"), { description = "Google Lens" })
hl.bind(
	"SUPER + SHIFT + 2",
	hl.dsp.exec_cmd(
		"qs -c $qsConfig ipc call TEST_ALIVE || pidof slurp || ~/.config/hypr/hyprland/scripts/snip_to_search.sh"
	)
) -- # [hidden]

hl.bind(
	"SUPER + SHIFT + X",
	hl.dsp.global("quickshell:regionOcr"),
	{ description = "Character recognition >> clipboard" }
)
hl.bind(
	"SUPER + SHIFT + X",
	hl.dsp.exec_cmd(
		"qs -c $qsConfig ipc call TEST_ALIVE || pidof slurp || grim -g \"$(slurp $SLURP_ARGS)\" \"/tmp/ocr_image.png\" && tesseract \"/tmp/ocr_image.png\" stdout -l $(tesseract --list-langs | awk 'NR>1{print $1}' | tr '\\n' '+' | sed 's/\\+$/\\n/') | wl-copy && rm \"/tmp/ocr_image.png\""
	)
) -- # [hidden]

hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), { description = "Color picker" })

hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"), { locked = true, description = "Screenshot >> clipboard" })
hl.bind(
	"CTRL + Print",
	hl.dsp.exec_cmd(
		"mkdir -p $(xdg-user-dir PICTURES)/Screenshots && grim $(xdg-user-dir PICTURES)/Screenshots/Screenshot_\"$(date '+%Y-%m-%d_%H.%M.%S')\".png"
	),
	{ locked = true, non_consuming = true, description = "Screenshot >> clipboard & file (file)" }
)
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grim - | wl-copy"), { locked = true, non_consuming = true }) -- # [hidden]

hl.bind(
	"SUPER + SHIFT + R",
	hl.dsp.global("quickshell:regionRecord"),
	{ locked = true, description = "Record region (no sound)" }
)
hl.bind(
	"SUPER + SHIFT + R",
	hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/quickshell/$qsConfig/scripts/videos/record.sh"),
	{ locked = true }
) -- # [hidden]
hl.bind(
	"CTRL + ALT + R",
	hl.dsp.exec_cmd("~/.config/quickshell/$qsConfig/scripts/videos/record.sh --fullscreen"),
	{ locked = true }
) -- # [hidden]
hl.bind(
	"SUPER + SHIFT + ALT + R",
	hl.dsp.exec_cmd("~/.config/quickshell/$qsConfig/scripts/videos/record.sh --fullscreen --sound"),
	{ locked = true, description = "Record screen (with sound)" }
)

hl.bind(
	"SUPER + SHIFT + ALT + mouse:273",
	hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/ai/primary-buffer-query.sh"),
	{ description = "Generate AI summary for selected text" }
) -- # [hidden]

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

-- hl.bind("SUPER + ALT + F11", hl.dsp.exec_cmd("bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i "nipple" | grep -v -i "pussy" | shuf -n 1); ACTION=$(notify-send "Test notification with body image" "This notification should contain your user account <b>image</b> and <a href=\"https://discord.com/app\">Discord</a> <b>icon</b>. Oh and here is a random image in your Pictures folder: <img src=\"$RANDOM_IMAGE\" alt=\"Testing image\"/>" -a "Hyprland keybind" -p -h "string:image-path:/var/lib/AccountsService/icons/$USER" -t 6000 -i "discord" -A "openImage=Profile image" -A "action2=Open the random image" -A "action3=Useless button"); [[ $ACTION == *openImage ]] && xdg-open "/var/lib/AccountsService/icons/$USER"; [[ $ACTION == *action2 ]] && xdg-open \"$RANDOM_IMAGE\"'")) -- # [hidden]
-- hl.bind("SUPER + ALT + F12", hl.dsp.exec_cmd("bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i "nipple" | grep -v -i "pussy" | shuf -n 1); ACTION=$(notify-send "Test notification" "This notification should contain a random image in your <b>Pictures</b> folder and <a href=\"https://discord.com/app\">Discord</a> <b>icon</b>.\n<i>Flick right to dismiss!</i>" -a "Discord (fake)" -p -h "string:image-path:$RANDOM_IMAGE" -t 6000 -i "discord" -A "openImage=Profile image" -A "action2=Useless button"); [[ $ACTION == *openImage ]] && xdg-open "/var/lib/AccountsService/icons/$USER"'")) -- # [hidden]

hl.bind("SUPER + Space", hl.dsp.exec_cmd("vicinae toggle"), { description = "App menu" })
hl.bind("SUPER + W", hl.dsp.exec_cmd("zen-browser"), { description = "Browser" })
hl.bind("SUPER + Return", hl.dsp.exec_cmd("ghostty"), { description = "Terminal" })
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"), { description = "File manager" })
hl.bind(
	"SUPER + T",
	hl.dsp.exec_cmd("pkill btop || kitty -T btop -c ~/.config/kitty/btop.conf btop"),
	{ description = "Task manager" }
)

hl.bind(
	"SUPER + Escape",
	hl.dsp.exec_cmd("qs -p ~/.config/quickshell/$qsConfig/settings.qml"),
	{ description = "Settings app" }
)

hl.bind(
	"CTRL + SUPER + V",
	hl.dsp.exec_cmd('~/.config/hypr/hyprland/scripts/launch_first_available.sh "pavucontrol-qt" "pavucontrol"'),
	{ description = "Volume mixer" }
)

hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("loginctl lock-session"), { description = "Lock" })
hl.bind(
	"SUPER + SHIFT + CTRL + Q",
	hl.dsp.exec_cmd("systemctl suspend || loginctl suspend"),
	{ locked = true, description = "Suspend system" }
)
hl.bind(
	"CTRL + SHIFT + ALT + SUPER + Delete",
	hl.dsp.exec_cmd("systemctl poweroff || loginctl poweroff"),
	{ description = "Shutdown" }
) -- # [hidden]

hl.bind(
	"SUPER + Minus",
	hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh decrease 0.3"),
	{ repeating = true, description = "Zoom out" }
)
hl.bind(
	"SUPER + Equal",
	hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh increase 0.3"),
	{ repeating = true, description = "Zoom in" }
)
hl.bind(
	"SUPER + mouse_down",
	hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh increase 0.25"),
	{ description = "Zoom out" }
)
hl.bind(
	"SUPER + mouse_up",
	hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh decrease 0.25"),
	{ description = "Zoom in" }
)
hl.bind(
	"SUPER + 0",
	hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh decrease 10"),
	{ description = "Reset zoom" }
)

hl.bind("CTRL + SUPER + Backslash", hl.dsp.window.resize({ x = 640, y = 480, "exact" })) -- # [hidden]

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
