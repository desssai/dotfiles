import { App, Astal, Gtk, Gdk, Utils, hook } from "astal/gtk4";
import { bind, GLib, Variable } from "astal";
import Hyprland from "gi://AstalHyprland";
import WirePlumber from "gi://AstalWp";
import app from "astal/gtk4/app";

function StartWidget(): JSX.Element {
  const { START, END, FILL } = Gtk.Align;

  const hyprland = Hyprland.get_default();
  const title = bind(hyprland, "focusedClient").as((client) =>
    client ? client.initialTitle : "",
  );

  return (
    <box cssName="first" spacing={12} halign={FILL}>
      <button cssName="settings" halign={START}>
        <image iconName={GLib.get_os_info("LOGO") || "missing-symbolic"} />
      </button>
      <label cssName="client" halign={END} label={title} />
    </box>
  );
}

function MiddleWidget(): JSX.Element {
  const { CENTER } = Gtk.Align;

  const hyprland = Hyprland.get_default();
  const workspaces = [];

  for (let i = 1; i < 10; i++) {
    workspaces.push(
      <box cssName="workspace" halign={CENTER} valign={CENTER}>
        <button
          setup={(self) => {
            const remove = function (self: Gtk.Button, id: number) {
              if (id == i) {
                self.cssClasses = ["removed"];
              }
            };
            const add = function (self: Gtk.Button, id: number) {
              if (id == i) {
                self.cssClasses = ["active"];
              }
            };
            const update = function (self: Gtk.Button, id: number) {
              if (self.cssClasses.length === 2) {
                self.cssClasses = ["active"];
              }
              if (id == i) {
                self.cssClasses = ["active", "focused"];
              }
            };
            const listen = function (self, event: String, id: number) {
              switch (event) {
                case "workspace":
                  update(self, id);
                  break;
                case "destroyworkspace":
                  remove(self, id);
                  break;
                case "createworkspace":
                  add(self, id);
                  break;
                default:
                  break;
              }
            };

            if (hyprland.workspaces.find((ws) => ws.id === i)) {
              self.cssClasses = ["active"];
            }
            if (hyprland.focusedWorkspace.id === i) {
              self.cssClasses = ["active", "focused"];
            }
            hook(self, hyprland, "event", listen);
          }}
          hexpand
          onClicked={() => hyprland.dispatch("workspace", `${i}`)}
        >
          <box cssName="dot" valign={CENTER} halign={CENTER}></box>
        </button>
      </box>,
    );
  }

  return (
    <box cssName="workspaces" hexpand={false}>
      {workspaces}
    </box>
  );
}

function EndWidget(): JSX.Element {
  const wp = WirePlumber.get_default();
  const time = Variable("").poll(1000, 'date "+%a  %d  %b  %H:%M"');

  return (
    <box cssName="tooltip" hexpand={false}>
      <menubutton cssName="wifi" iconName=""></menubutton>
      <menubutton cssName="battery">
        <image iconName="arch-lit" />
      </menubutton>
      <menubutton
        cssName="input-sound"
        iconName="audio-input-microphone"
      ></menubutton>
      <button cssName="output-sound">
        <button>
          <image iconName="audio-speakers" />
        </button>
      </button>
      <menubutton cssName="calendar">
        <label label={time()} onDestroy={() => time.drop()} />
      </menubutton>
    </box>
  );
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      // visible
      name={"bar"}
      cssClasses={["Bar"]}
      gdkmonitor={gdkmonitor}
      layer={Astal.Layer.TOP}
      exclusivity={Astal.Exclusivity.NORMAL}
      anchor={TOP | LEFT | RIGHT}
      application={App}
      defaultHeight={8}
      onHoverLeave={() => App.toggle_window("bar")}
    >
      <centerbox cssName="bar">
        <StartWidget />
        <MiddleWidget />
        <EndWidget />
      </centerbox>
    </window>
  );
}
// <menubutton hexpand halign={Gtk.Align.CENTER}>
//   <label onDestroy={() => time.drop()} label={time()} />
//   <popover>
//     <Gtk.Calendar />
//   </popover>
// </menubutton>
