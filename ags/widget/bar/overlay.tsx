import { App, Astal, Gtk, Gdk, hook } from "astal/gtk4";

export default function BarOverlay(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible
      name={`overlay`}
      gdkmonitor={gdkmonitor}
      namespace={"hello"}
      exclusivity={Astal.Exclusivity.IGNORE}
      layer={Astal.Layer.OVERLAY}
      anchor={TOP | LEFT | RIGHT}
      application={App}
      heightRequest={10}
      defaultHeight={10}
      onHoverEnter={() => App.toggle_window("bar")}
    ></window>
  );
}
