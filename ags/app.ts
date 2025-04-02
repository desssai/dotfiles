import { App } from "astal/gtk4";
import style from "./source/scss/style.scss";
import bar from "./source/tsx/bar";
// import overlay from "./source/tsx/overlay";
import menu from "./source/tsx/menu";
import background from "./source/tsx/background";

App.start({
  css: style,
  main() {
    App.get_monitors().map(background);
    // App.get_monitors().map(bar);
    App.get_monitors().map(menu);
  },
});
