const audio = await Service.import("audio");

export function OutputVolumeControls(
  width: integer = 600,
  height: integer = 400,
) {
  const volume = audio.speaker.bind("volume");

  return Widget.Window({
    setup: (self) =>
      self.keybind("Escape", () => {
        App.closeWindow("ags-widget-output-sound");
      }),
    name: "ags-widget-output-sound",
    visible: false,
    layer: "overlay",
    exclusivity: "exclusive",
    keymode: "exclusive",
    anchor: ["top", "right"],
    child: Widget.Box({
      css: `min-width: ${width}px; min-height: ${height}px;`,
      class_name: "output-volume-controls-container",
    }),
  });
}

export function OutputVolume() {
  const volume = audio.speaker.bind("volume");

  const icon = Widget.Icon({
    class_name: "output-volume-icon",
    icon: volume.as((value) => {
      value *= 100;
      return `audio-volume-${
        value == 0
          ? "muted"
          : value < 34
            ? "low"
            : value < 67
              ? "medium"
              : "high"
      }-symbolic`;
    }),
  });

  const button = Widget.Button({
    class_name: "output-volume-button",
    css: "min-width: 40px",
    child: icon,
    onClicked: () => Utils.execAsync("ags -t ags-widget-output-sound"),
  });

  return Widget.Box({
    child: button,
  });
}

export function InputVolume() {
  const icon = Widget.Icon({
    class_name: "input-volume-icon",
    icon: "audio-input-microphone",
  });

  const button = Widget.Button({
    class_name: "input-volume-button",
    css: "min-width: 40px",
    child: icon,
  });

  return Widget.Box({
    child: button,
  });
}

// export function InputVolume() {
//   const icons = {
//     101: "overamplified",
//     67: "high",
//     34: "medium",
//     1: "low",
//     0: "muted",
//   };

//   function getIcon() {
//     const icon = audio.speaker.is_muted
//       ? 0
//       : [101, 67, 34, 1, 0].find(
//           (threshold) => threshold <= audio.speaker.volume * 100,
//         );

//     return `audio-volume-${icons[icon]}-symbolic`;
//   }

//   const icon = Widget.Icon({
//     icon: Utils.watch(getIcon(), audio.speaker, getIcon),
//   });

//   const slider = Widget.Slider({
//     hexpand: true,
//     draw_value: false,
//     on_change: ({ value }) => (audio.speaker.volume = value),
//     setup: (self) =>
//       self.hook(audio.speaker, () => {
//         self.value = audio.speaker.volume || 0;
//       }),
//   });

//   return Widget.Box({
//     class_name: "volume",
//     css: "min-width: 180px",
//     children: [icon, slider],
//   });
// }
