-- You can put extra environment variables here
-- https://wiki.hyprland.org/Configuring/Environment-variables/

-- ------------------ Input method --------------------
-- See https://fcitx-im.org/wiki/Using"_F"citx_5_on"_W"ayland
--hl.env("QT_IM_MODULE", fcitx)
--hl.env("XMODIFIERS", @im=fcitx)
--hl.env("SDL_IM_MODULE", fcitx)
--hl.env("GLFW_IM_MODULE", ibus)
--hl.env("INPUT_METHOD", fcitx)

-- ---------------- Wayland ------------------
-- Tearing
-- hl.env("WLR_DRM_NO_ATOMIC", 1)
-- ?
-- hl.env("WLR_NO_HARDWARE_CURSORS", 1)

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- ---------------- "EDITOR" ------------------
--https://wiki.archlinux.org/title/Category:Text_editors
-- for example: vi nano nvim ...

--hl.env("EDITOR", vim)
-- "XDG" "SPECIFICATIONS"
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- "GDK" "SPECIFICATIONS"
hl.env("GDK_BACKEND", "wayland")

-- "THEME" "RELATED" "ENVS"
-- hl.env("GTK_THEME",WhiteSur-Dark-solid)
-- hl.env("XCURSOR_THEME",WhiteSur-cursors)
-- hl.env("XCURSOR_SIZE",16)
-- hl.env("HYPRCURSOR_THEME",WhiteSur-cursors)
-- hl.env("HYPRCURSOR_SIZE",16)

-- "SET" "WAYLAND" "AS" A "COMPOSITOR" "FOR" "FIREFOX"
hl.env("MOZ_ENABLE_WAYLAND", 1)

-- "QT"
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", 1)
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)

-- "SDL"2
hl.env("SDL_VIDEODRIVER", "wayland")

-- "GLFW"
hl.env("GLFW_USE_WAYLAND", 1)

-- "NVIDIA"
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("NVD_BACKEND",direct)

-- "ENABLE" "GPU" "ACCELERATION"
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", 1)
