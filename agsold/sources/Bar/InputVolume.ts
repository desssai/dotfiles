const audio = await Service.import("audio");

function InputVolumeSlider() {
  const microphone = audio.bind("microphone");

  return Widget.Box({
    vertical: true,
    className: "volume-controls-slider-container",
    spacing: 12,
    children: [
      Widget.Label({
        hpack: "start",
        className: "volume-controls-slider-title",
        label: "Sound",
      }),
      Widget.Slider({
        className: "volume-controls-slider",
        drawValue: false,
        hasOrigin: true,
        min: 0.0,
        max: 1.0,
        step: 0.1,
        value: microphone.as((mp) => {
          return mp.volume;
        }),
        onChange: ({ value }) => {
          audio.microphone.volume = value;
        },
      }),
      Widget.Box({
        className: "volume-controls-separator",
        css: "min-height: 1px;",
      }),
    ],
  });
}

function InputVolumeSpeakers() {
  const microphones = audio.bind("microphones");

  return Widget.Box({
    vertical: true,
    className: "volume-controls-items",
    spacing: 12,
    children: microphones.as((mps) => {
      return [
        Widget.Label({
          hpack: "start",
          className: "volume-controls-slider-title",
          label: "Input",
        }),
        ...mps.map((mp) => {
          return Widget.EventBox({
            className: "volume-controls-item-container",
            child: Widget.Box({
              spacing: 12,
              children: [
                Widget.Icon({
                  className: "volume-controls-item-icon",
                  icon: mp.icon_name,
                }),
                Widget.Label({
                  className: "volume-controls-item-label",
                  label: mp.description,
                }),
              ],
            }),
            onPrimaryClickRelease: () => mp.connect(),
          });
        }),
      ];
    }),
  });
}

function InputVolumeWidget() {
  return Widget.Box({
    className: "volume-controls-container",
    css: `min-width: 300px; min-height: 2px;`,
    vertical: true,
    spacing: 8,
    children: [InputVolumeSlider(), InputVolumeSpeakers()],
  });
}

export function InputVolumeControls() {
  return Widget.Window({
    setup: (self) =>
      self.keybind("Escape", () => {
        App.closeWindow("ags-widget-input-sound");
      }),
    name: "ags-widget-input-sound",
    visible: false,
    layer: "overlay",
    exclusivity: "exclusive",
    keymode: "exclusive",
    anchor: ["top", "right"],
    margins: [0, 300],
    child: InputVolumeWidget(),
  });
}

export function InputVolume() {
  const volume = audio.microphone.bind("volume").as((volume) => {
    return volume * 100;
  });

  const icon = Widget.Icon({
    className: "input-volume-icon",
    icon: volume.as((value) => {
      return `/home/ncarob/.local/share/icons/WhiteSur/status/symbolic/audio-input-microphone-${
        value == 0
          ? "muted"
          : value < 34
            ? "low"
            : value < 67
              ? "medium"
              : "high"
      }-symbolic.svg`;
    }),
  });

  const button = Widget.Button({
    className: "input-volume-button",
    css: "min-width: 48px",
    child: icon,
    onClicked: () => Utils.execAsync("ags -t ags-widget-input-sound"),
  });

  return Widget.Box({
    child: button,
  });
}
