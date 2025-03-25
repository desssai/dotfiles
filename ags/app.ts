import { App } from "astal/gtk4";
import style from "./style.scss";
import Bar from "./widget/bar/Bar";
import Menu from "./widget/menu/Menu";

App.start({
  css: style,
  main() {
    App.get_monitors().map(Bar);
    App.get_monitors().map(Menu);
  },
});
