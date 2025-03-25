const battery = await Service.import("battery");

// export function Battery() {
//   const value = battery.bind("percent").as((p) => (p > 0 ? p / 100 : 0));

//   return Widget.Box({
//     class_name: "battery",
//     visible: battery.bind("available"),
//     children: [
//       Widget.LevelBar({
//         widthRequest: 140,
//         vpack: "center",
//         value,
//       }),
//     ],
//   });
// }

export function Battery() {
  const power = battery.bind("percent");

  console.log(Utils.lookUpIcon("battery-level-0-symbolic")?.get_filename());
  console.log(Utils.lookUpIcon("battery-level-10-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-20-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-30-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-40-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-50-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-60-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-70-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-80-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-90-symbolic"));
  console.log(Utils.lookUpIcon("battery-level-100-symbolic"));

  const icon = Widget.Icon({
    className: "battery-icon",
    icon: power.as((value) => {
      return `battery-level-${
        value < 10
          ? "0"
          : value < 20
            ? "10"
            : value < 30
              ? "20"
              : value < 40
                ? "30"
                : value < 50
                  ? "40"
                  : value < 60
                    ? "50"
                    : value < 70
                      ? "60"
                      : value < 80
                        ? "70"
                        : value < 90
                          ? "80"
                          : value < 95
                            ? "90"
                            : "100"
      }-symbolic`;
    }),
  });

  const button = Widget.Button({
    className: "battery-button",
    css: "min-width: 48px",
    child: icon,
    // onClicked: () => Utils.execAsync("ags -t ags-widget-input-sound"),
  });

  return Widget.Box({
    child: button,
  });
}
