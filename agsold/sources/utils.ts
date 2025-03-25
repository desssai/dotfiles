import { Widget } from "types/@girs/gtk-3.0/gtk-3.0.cjs";
import { Hyprland, Monitor, Workspace } from "types/service/hyprland";

const hyprland = await Service.import("hyprland");

export function forMonitors(func: (monitor: Monitor) => Widget.Window[]) {
  const windows = [];
  const monitors = hyprland.monitors;

  for (let i = 0; i < monitors.length; i++) {
    windows.push(func(monitors[i]));
  }

  return windows;
}
