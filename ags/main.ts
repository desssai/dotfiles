import { forMonitors, setBars, setBackrounds } from "./sources/utils.ts";
import { Bar } from "./sources/bar/bar.ts";
import { applauncher } from "sources/menu/applications.ts";
import { NotificationPopups } from "sources/notifications/popups.ts";

function Backgrounds(monitor: Monitor) {
  return Widget.Window({
    name: `ags-bg-${monitor.id}`,
    class_name: "ags-background",
    anchor: ["bottom"],
    monitor,
    layer: "background",
    child: Widget.Box({
      css: `min-height: ${monitor.height}px; min-width: ${monitor.width}px;`,
    }),
  });
}

function Bars(monitor: Monitor) {
  return Widget.Window({
    name: `ags-bar-${monitor.id}`,
    class_name: "ags-bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Bar(),
  });
}

App.config({
  style: "./style.css",
  windows: [
    ...forMonitors(Bars),
    ...forMonitors(Backgrounds),
    ...forMonitors(NotificationPopups),
    applauncher,
  ],
});

// const mpris = await Service.import("mpris")

// function Media() {
//   const label = Utils.watch("", mpris, "player-changed", () => {
//     if (mpris.players[0]) {
//       const { track_artists, track_title } = mpris.players[0];
//       return `${track_artists.join(", ")} - ${track_title}`;
//     } else {
//       return "Nothing is playing";
//     }
//   });

//   return Widget.Button({
//     class_name: "media",
//     on_primary_click: () => mpris.getPlayer("")?.playPause(),
//     on_scroll_up: () => mpris.getPlayer("")?.next(),
//     on_scroll_down: () => mpris.getPlayer("")?.previous(),
//     child: Widget.Label({ label }),
//   });
// }
