#!/bin/sh

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock |
while read -r line; do
  if [[ ${line:0:13} = "activewindow>" ]]; then
    echo $line | awk -F ">>" '{print $2}' | awk -F "," '{print $1}';
  fi
done
