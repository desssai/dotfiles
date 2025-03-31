import { App, Astal, Gtk, Gdk } from "astal/gtk4";

export default function bar(monitor: Gdk.Monitor): Astal.Window {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible
      name={"bar"}
      application={App}
      layer={Astal.Layer.TOP}
      anchor={LEFT | TOP | RIGHT}
      gdkmonitor={monitor}
    >
      <centerbox halign={Gtk.Align.CENTER} valign={Gtk.Align.START}>
        <box />
        <box hexpand={false}>
          <box name="settings" vexpand hexpand></box>
          <box name="multimedia" vexpand hexpand></box>
        </box>
        <box />
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
