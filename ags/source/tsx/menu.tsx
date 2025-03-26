import { App, Astal, Gdk, Gtk } from "astal/gtk4";
import { Variable } from "astal";
import Apps from "gi://AstalApps";

const MAX_ITEMS = 128;

function hide() {
  App.get_window("launcher")!.hide();
}

function AppButton({ app }: { app: Apps.Application }) {
  return (
    <button
      className="AppButton"
      onClicked={() => {
        hide();
        app.launch();
      }}
    >
      <box>
        <image iconName={app.iconName} />
        <box valign={Gtk.Align.CENTER} vertical>
          <label className="name" truncate xalign={0} label={app.name} />
          {app.description && (
            <label
              className="description"
              wrap
              xalign={0}
              label={app.description}
            />
          )}
        </box>
      </box>
    </button>
  );
}

export default function Applauncher() {
  const { CENTER } = Gtk.Align;
  const apps = new Apps.Apps();
  const width = Variable(3440);

  const text = Variable("");
  const list = text((text) => apps.fuzzy_query(text).slice(0, MAX_ITEMS));
  const onEnter = () => {
    apps.fuzzy_query(text.get())?.[0].launch();
    hide();
  };

  return (
    <window
      name="launcher"
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM}
      exclusivity={Astal.Exclusivity.IGNORE}
      keymode={Astal.Keymode.EXCLUSIVE}
      application={App}
      onShow={(self) => {
        text.set("");
        // width.set(self.get_current_monitor().workarea.width); // TODO: rework menu width & height
      }}
      onKeyPressed={(self, keyval) => {
        if (keyval == Gdk.KEY_Escape) {
          self.hide();
          text.set("");
        }
      }}
    >
      <box>
        <button
          widthRequest={width((w) => w / 2)}
          expand
          onClicked={() => hide()}
        />
        <box hexpand={false} vertical>
          <button heightRequest={100} onClicked={() => hide()} />
          <box widthRequest={500} className="Applauncher" vertical>
            <entry
              placeholderText="Search"
              // text={text((str) => (str ? str : ""))} // TODO: make a binding to text with a placeholder so that
              onChanged={(self) => text.set(self.text)}
              onActivate={onEnter}
            />
            <box spacing={6} vertical>
              {list.as((list) => list.map((app) => <AppButton app={app} />))}
            </box>
            <box
              halign={CENTER}
              className="not-found"
              vertical
              visible={list.as((l) => l.length === 0)}
            >
              <image iconName="system-search-symbolic" />
              <label label="No match found" />
            </box>
          </box>
          <button expand onClicked={() => hide()} />
        </box>
        <button
          widthRequest={width((w) => w / 2)}
          expand
          onClicked={() => hide()}
        />
      </box>
    </window>
  );
}
