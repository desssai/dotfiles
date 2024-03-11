#!/bin/sh

hyprctl -j activeworkspace |
  jq -c 'del(.windows)
      | del(.hasfullscreen)
      | del(.lastwindow)
      | del(.lastwindowtitle)'

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock |
while read -r line; do
  if [ $(echo $line | grep "^workspace>.*" | wc -c) -ne 0 ]; then
    hyprctl -j activeworkspace |
      jq -c 'del(.windows)
          | del(.hasfullscreen)
          | del(.lastwindow)
          | del(.lastwindowtitle)'
  fi
done
