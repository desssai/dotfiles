import { App, Astal, Gdk, Gtk } from "astal/gtk4";

export default function background(monitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor;

  return (
    <window
      visible
      name={"background"}
      layer={Astal.Layer.BACKGROUND}
      anchor={LEFT | TOP | RIGHT | BOTTOM}
      gdkmonitor={monitor}
    />
  );
}
