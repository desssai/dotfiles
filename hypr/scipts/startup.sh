#!/bin/sh

if [ $(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}') = "closed" ]; then
  hyprctl keyword monitor "eDP-1, disable"
fi

gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Light-solid'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur-light'
gsettings set org.gnome.desktop.interface cursor-theme 'SVG-WhiteSur-Cursor'

hyprctl setcursor SVG-WhiteSur-Cursor 24

eww open bar
