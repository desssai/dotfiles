#!/bin/sh

if [ -f /proc/acpi/button/lid/LID0/state ]; then
  if [ $(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}') = "closed" ]; then
    hyprctl keyword monitor "eDP-1, disable"
  fi
fi
