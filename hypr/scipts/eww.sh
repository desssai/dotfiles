#!/bin/sh

set_active_workspaces() {
  ACTIVE=$(hyprctl -j activeworkspace |
    jq -c 'del(.windows)
        | del(.hasfullscreen)
        | del(.lastwindow)
        | del(.lastwindowtitle)')

  eww update space-active-json=$ACTIVE
}

set_total_workspaces() {
  TOTAL=$(hyprctl -j workspaces |
    jq -c 'sort | map(del(.windows))
        | map(del(.hasfullscreen))
        | map(del(.lastwindow))
        | map(del(.lastwindowtitle))')

  eww update spaces-total-json=$TOTAL
}

set_active_title() {
  TITLE=$(echo $1 | awk -F ">>" '{print $2}' | awk -F "," '{print $1}')

  eww update title-active=$TITLE
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock |
while read -r line; do
  if [ $(echo $line | grep "^workspace>.*" | wc -c) -ne 0 ]; then
    set_active_workspaces
  elif [ $(echo $line | grep ".\{1,\}workspace>.*" | wc -c) -ne 0 ]; then
    set_total_workspaces
  elif [[ ${line:0:13} = "activewindow>" ]]; then
    set_active_title "$line"
  fi
done
