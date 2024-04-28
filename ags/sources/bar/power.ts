const battery = await Service.import("battery");

export function Battery() {
  const value = battery.bind("percent").as((p) => (p > 0 ? p / 100 : 0));

  return Widget.Box({
    class_name: "battery",
    visible: battery.bind("available"),
    children: [
      Widget.LevelBar({
        widthRequest: 140,
        vpack: "center",
        value,
      }),
    ],
  });
}
