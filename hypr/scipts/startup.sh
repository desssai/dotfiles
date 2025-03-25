#!/bin/sh

if [ -f /proc/acpi/button/lid/LID0/state ]; then
  if [ $(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}') = "closed" ]; then
    hyprctl keyword monitor "eDP-1, disable"
  fi
fi

gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Dark-solid'
gsettings set org.gnome.desktop.interface font-name 'SF Pro Display'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur'
gsettings set org.gnome.desktop.interface cursor-theme 'WhiteSur-cursors'
