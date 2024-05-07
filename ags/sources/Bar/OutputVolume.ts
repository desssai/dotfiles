const audio = await Service.import("audio");

function OutputVolumeSlider() {
  const speaker = audio.bind("speaker");

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
        value: speaker.as((sp) => {
          return sp.volume;
        }),
        onChange: ({ value }) => {
          audio.speaker.volume = value;
        },
      }),
      Widget.Box({
        className: "volume-controls-separator",
        css: "min-height: 1px;",
      }),
    ],
  });
}

function OutputVolumeSpeakers() {
  const speakers = audio.bind("speakers");

  return Widget.Box({
    vertical: true,
    className: "volume-controls-items",
    spacing: 12,
    children: speakers.as((sps) => {
      return [
        Widget.Label({
          hpack: "start",
          className: "volume-controls-slider-title",
          label: "Output",
        }),
        ...sps.map((sp) => {
          return Widget.EventBox({
            className: "volume-controls-item-container",
            child: Widget.Box({
              spacing: 12,
              children: [
                Widget.Icon({
                  className: "volume-controls-item-icon",
                  icon: sp.icon_name,
                }),
                Widget.Label({
                  className: "volume-controls-item-label",
                  label: sp.description,
                }),
              ],
            }),
            onPrimaryClickRelease: () => sp.connect(),
          });
        }),
      ];
    }),
  });
}

function OutputVolumeWidget() {
  return Widget.Box({
    className: "volume-controls-container",
    css: `min-width: 300px; min-height: 2px;`,
    vertical: true,
    spacing: 8,
    children: [OutputVolumeSlider(), OutputVolumeSpeakers()],
  });
}

export function OutputVolumeControls() {
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
    margins: [0, 300],
    child: OutputVolumeWidget(),
  });
}

export function OutputVolume() {
  const volume = audio.speaker.bind("volume").as((volume) => {
    return volume * 100;
  });

  const icon = Widget.Icon({
    className: "output-volume-icon",
    icon: volume.as((value) => {
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
    className: "output-volume-button",
    css: "min-width: 48px",
    child: icon,
    onClicked: () => Utils.execAsync("ags -t ags-widget-output-sound"),
  });

  return Widget.Box({
    child: button,
  });
}
