import { Hyprland, Monitor, Workspace } from "types/service/hyprland";

const hyprland = await Service.import("hyprland");

export function Workspaces() {
  const active = hyprland.active.workspace.bind("id");
  const widgets: Widget.Button[] = [];

  for (let i = 1; i < 10; i++) {
    widgets.push(
      Widget.Button({
        hpack: "center",
        vpack: "center",
        css: "min-width: 16px; min-height: 16px;",
        on_clicked: () => hyprland.messageAsync(`dispatch workspace ${i}`),
        className: active.as((id) => {
          return `${id === i ? "workspace workspace-active" : "workspace workspace-inactive"}`;
        }),
      }),
    );
  }

  return Widget.Box({
    class_name: "workspaces",
    children: widgets,
    spacing: 12,
  });
}

export function ClientClass() {
  return Widget.Label({
    class_name: "client-title",
    label: hyprland.active.client.bind("class"),
  });
}
