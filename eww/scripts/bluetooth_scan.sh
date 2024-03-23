#!/bin/sh

bluetoothctl devices | cut -f2 -d' ' | 
  while read uuid;
    do bluetoothctl info $uuid | jq '.'
  done

