import Gdk from "gi://Gdk";
import GLib from "gi://GLib?version=2.0";
const hyprland = await Service.import("hyprland");

/**
 * @returns [start...length]
 */
export function range(length: number, start = 1) {
  return Array.from({ length }, (_, i) => i + start);
}
