#!/bin/sh

hyprctl -j workspaces |
  jq -c 'sort | map(del(.windows))
      | map(del(.hasfullscreen))
      | map(del(.lastwindow))
      | map(del(.lastwindowtitle))'

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock |
while read -r line; do
  if [ $(echo $line | grep ".\{1,\}workspace>.*" | wc -c) -ne 0 ]; then
    hyprctl -j workspaces |
      jq -c 'sort | map(del(.windows))
          | map(del(.hasfullscreen))
          | map(del(.lastwindow))
          | map(del(.lastwindowtitle))'
  fi
done
