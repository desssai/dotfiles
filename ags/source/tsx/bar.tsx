import { App, Astal, Gtk, Gdk } from "astal/gtk4";

export default function bar(monitor: Gdk.Monitor): Astal.Window {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible
      name={"bar"}
      layer={Astal.Layer.TOP}
      anchor={LEFT | TOP | RIGHT}
      gdkmonitor={monitor}
    >
      <centerbox halign={Gtk.Align.CENTER}>
        <box widthRequest={1000} heightRequest={8} hexpand={false} />
      </centerbox>
    </window>
  );

  // return new Astal.Window({
  //   visible: true,
  //   name: "bar",
  //   gdkmonitor: monitor,
  //   anchor: LEFT | TOP | RIGHT,
  //   exclusivity: Astal.Exclusivity.NORMAL,
  //   layer: Astal.Layer.TOP,
  //   keymode: Astal.Keymode.ON_DEMAND,
  //   child: barWidget(),
  // });
}
