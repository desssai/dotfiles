#!/bin/sh

if [ -f /proc/acpi/button/lid/LID0/state ]; then
  if [ $(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}') = "closed" ]; then
    hyprctl keyword monitor "eDP-1, disable"
  fi
fi

gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Light-solid'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'
gsettings set org.gnome.desktop.interface cursor-theme 'WhiteSur-cursors'

hyprctl setcursor 'WhiteSur-cursors' 24

eww open bar
eww open bg
