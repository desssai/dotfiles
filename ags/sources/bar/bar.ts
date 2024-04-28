import { Workspaces, ClientClass } from "./hyprland.ts";
import { SystemSettingsLogo } from "./system_settings.ts";
import { Volume } from "./sound.ts";
import { Battery } from "./power.ts";
import { Clock } from "./calendar.ts";

function Left() {
  return Widget.Box({
    hpack: "start",
    spacing: 16,
    margin_left: 16,
    children: [SystemSettingsLogo(), ClientClass()],
  });
}

function Center() {
  return Widget.Box({
    hpack: "center",
    spacing: 8,
    children: [Workspaces()],
  });
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 16,
    margin_right: 16,
    children: [Volume(), Battery(), Clock()],
  });
}

export function Bar() {
  return Widget.CenterBox({
    css: "min-height: 30px;",
    start_widget: Left(),
    center_widget: Center(),
    end_widget: Right(),
  });
}
