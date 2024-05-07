import { forMonitors } from "./sources/utils.ts";
import { Bar } from "./sources/Bar/Bar.ts";
import { applauncher } from "sources/Menu/applications.ts";
import { OutputVolumeControls } from "sources/Bar/OutputVolume.ts";
import { InputVolumeControls } from "sources/Bar/InputVolume.ts";
import { NotificationPopups } from "sources/Notifications/Popups.ts";

function Backgrounds(monitor: Monitor) {
  return Widget.Window({
    name: `ags-bg-${monitor.id}`,
    anchor: ["bottom"],
    monitor,
    layer: "background",
    child: Widget.Box({
      class_name: "ags-background",
      css: `min-height: ${monitor.height}px; min-width: ${monitor.width}px;`,
    }),
  });
}

function Bars(monitor: Monitor) {
  return Widget.Window({
    name: `ags-bar-${monitor.id}`,
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Bar(),
  });
}

App.config({
  style: "./style.css",
  iconTheme: "/usr/share/icons/WhiteSur",
  windows: [
    ...forMonitors(Bars),
    ...forMonitors(Backgrounds),
    ...forMonitors(NotificationPopups),
    OutputVolumeControls(600, 400),
    InputVolumeControls(600, 400),

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
